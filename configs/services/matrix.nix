{
  pkgs,
  settings,
  config,
  lib,
  ...
}: let
  keyFile = "/run/livekit.key";
in {
  # === Continuwuity ===

  services.matrix-continuwuity = {
    enable = true;
    package = pkgs.master.matrix-continuwuity;
    settings.global = {
      server_name = "signal.v0id.nl";
      allow_registration = true;
      allow_federation = true;
      allow_encryption = true;
      trusted_servers = ["matrix.org"];
      turn_uris = [
        "turn:signal.v0id.nl?transport=udp"
        "turn:signal.v0id.nl?transport=tcp"
        "turns:signal.v0id.nl?transport=udp"
        "turns:signal.v0id.nl?transport=tcp"
      ];
      turn_secret_file = config.sops.secrets.turn_secret.path;
      matrix_rtc.foci = [
        {
          type = "livekit";
          livekit_service_url = "https://signal.v0id.nl/livekit/jwt/";
        }
      ];
    };
  };

  # === Coturn ===

  services.coturn = rec {
    enable = true;
    no-cli = true;
    no-tcp-relay = true;
    min-port = 50201;
    max-port = 51200;
    use-auth-secret = true;
    static-auth-secret-file = config.sops.secrets.turn_secret.path;
    realm = "signal.v0id.nl";
    cert = "${config.security.acme.certs.${realm}.directory}/full.pem";
    pkey = "${config.security.acme.certs.${realm}.directory}/key.pem";
    extraConfig = ''
      # ban private IP ranges
      no-multicast-peers
      denied-peer-ip=0.0.0.0-0.255.255.255
      denied-peer-ip=10.0.0.0-10.255.255.255
      denied-peer-ip=100.64.0.0-100.127.255.255
      denied-peer-ip=127.0.0.0-127.255.255.255
      denied-peer-ip=169.254.0.0-169.254.255.255
      denied-peer-ip=172.16.0.0-172.31.255.255
      denied-peer-ip=192.0.0.0-192.0.0.255
      denied-peer-ip=192.0.2.0-192.0.2.255
      denied-peer-ip=192.88.99.0-192.88.99.255
      denied-peer-ip=192.168.0.0-192.168.255.255
      denied-peer-ip=198.18.0.0-198.19.255.255
      denied-peer-ip=198.51.100.0-198.51.100.255
      denied-peer-ip=203.0.113.0-203.0.113.255
      denied-peer-ip=240.0.0.0-255.255.255.255
      denied-peer-ip=::1
      denied-peer-ip=64:ff9b::-64:ff9b::ffff:ffff
      denied-peer-ip=::ffff:0.0.0.0-::ffff:255.255.255.255
      denied-peer-ip=100::-100::ffff:ffff:ffff:ffff
      denied-peer-ip=2001::-2001:1ff:ffff:ffff:ffff:ffff:ffff:ffff
      denied-peer-ip=2002::-2002:ffff:ffff:ffff:ffff:ffff:ffff:ffff
      denied-peer-ip=fc00::-fdff:ffff:ffff:ffff:ffff:ffff:ffff:ffff
      denied-peer-ip=fe80::-febf:ffff:ffff:ffff:ffff:ffff:ffff:ffff
    '';
  };

  # === Livekit ===

  services.livekit = {
    enable = true;
    openFirewall = false;
    # settings = {
    #   room.auto_create = false;
    #   rtc = {
    #     tcp_port = 7881;
    #     port_range_start = 50100;
    #     port_range_end = 50200;
    #     use_external_ip = true;
    #     enable_loopback_candidate = false;
    #     turn_servers = [
    #       {
    #         host = "signal.v0id.nl";
    #         port = 3478;
    #         protocol = "udp";
    #         secret = "";
    #       }
    #       {
    #         host = "signal.v0id.nl";
    #         port = 3478;
    #         protocol = "tcp";
    #         secret = "";
    #       }
    #       {
    #         host = "signal.v0id.nl";
    #         port = 5349;
    #         protocol = "tls";
    #         secret = "";
    #       }
    #     ];
    #   };
    # };
    inherit keyFile;
  };

  sops.templates."livekit.json" = {
    owner = "livekit";
    mode = "0400";
    content = builtins.toJSON {
      room.auto_create = false;
      rtc = {
        tcp_port = 7881;
        port_range_start = 50100;
        port_range_end = 50200;
        use_external_ip = true;
        enable_loopback_candidate = false;
        turn_servers = [
          {
            host = "signal.v0id.nl";
            port = 3478;
            protocol = "udp";
            secret = config.sops.placeholder.turn_secret;
          }
          {
            host = "signal.v0id.nl";
            port = 3478;
            protocol = "tcp";
            secret = config.sops.placeholder.turn_secret;
          }
          {
            host = "signal.v0id.nl";
            port = 5349;
            protocol = "tls";
            secret = config.sops.placeholder.turn_secret;
          }
        ];
      };
    };
  };

  systemd.services.livekit.serviceConfig = {
    DynamicUser = lib.mkForce false;
    User = "livekit";
    Group = "livekit";
    ExecStart = lib.mkForce "${config.services.livekit.package}/bin/livekit-server --config ${config.sops.templates."livekit.json".path} --key-file ${keyFile}";
  };

  users.users.livekit = {
    isSystemUser = true;
    group = "livekit";
  };
  users.groups.livekit = {};

  services.lk-jwt-service = {
    enable = true;
    livekitUrl = "wss://signal.v0id.nl/livekit/sfu/";
    inherit keyFile;
  };

  systemd.services.livekit-key = {
    before = ["lk-jwt-service.service" "livekit.service"];
    wantedBy = ["multi-user.target"];
    path = with pkgs; [livekit coreutils gawk];
    script = ''
      echo "Key missing, generating key"
      echo "lk-jwt-service: $(livekit-server generate-keys | awk '/API Key:/{key=$NF} /API Secret:/{print $NF}' | tail -1)" > "${keyFile}"
      chown livekit:livekit "${keyFile}"
      chmod 0400 "${keyFile}"
    '';
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      User = "root";
    };
    unitConfig.ConditionPathExists = "!${keyFile}";
  };
  systemd.services.lk-jwt-service.environment.LIVEKIT_FULL_ACCESS_HOMESERVERS = "signal.v0id.nl";

  # === Misc ===

  security.acme = {
    acceptTerms = true;
    defaults.email = settings.email;
    certs.${config.services.coturn.realm}.postRun = "systemctl restart coturn.service";
  };

  networking.firewall = {
    allowedTCPPorts = [80 443 3478 5349 7881];
    allowedUDPPorts = [3478 5349];
    allowedUDPPortRanges = [
      {
        from = config.services.livekit.settings.rtc.port_range_start;
        to = config.services.livekit.settings.rtc.port_range_end;
      }
      {
        from = config.services.coturn.min-port;
        to = config.services.coturn.max-port;
      }
    ];
  };

  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    recommendedOptimisation = true;
    recommendedGzipSettings = true;

    virtualHosts."signal.v0id.nl" = {
      enableACME = true;
      forceSSL = true;

      locations = {
        "/_matrix/" = {
          proxyPass = "http://127.0.0.1:6167";
        };
        "/.well-known/matrix/server" = {
          return = ''200 '{"m.server":"signal.v0id.nl:443"}' '';
          extraConfig = ''
            default_type application/json;
          '';
        };
        "/.well-known/matrix/client" = {
          return = ''200 '{"m.homeserver":{"base_url":"https://signal.v0id.nl"},"org.matrix.msc4143.rtc_foci":[{"type":"livekit","livekit_service_url":"https://signal.v0id.nl/livekit/jwt"}]}' '';
          extraConfig = ''
            default_type application/json;
            add_header Access-Control-Allow-Origin "*";
          '';
        };

        "^~ /livekit/jwt/" = {
          priority = 400;
          proxyPass = "http://127.0.0.1:${toString config.services.lk-jwt-service.port}/";
        };

        "^~ /livekit/sfu/" = {
          extraConfig = ''
            proxy_send_timeout 120;
            proxy_read_timeout 120;
            proxy_buffering off;

            proxy_set_header Accept-Encoding gzip;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection "upgrade";
          '';
          priority = 400;
          proxyPass = "http://127.0.0.1:${toString config.services.livekit.settings.port}/";
          proxyWebsockets = true;
        };
      };
    };
  };
}
