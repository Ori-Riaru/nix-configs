{settings, ...}: {
  security.acme = {
    acceptTerms = true;
    defaults.email = settings.email;
  };

  services.nginx.virtualHosts."riaru.xyz" = {
    enableACME = true;
    forceSSL = true;

    listen = [
      {
        addr = "0.0.0.0";
        port = 80;
      }
      {
        addr = "[::0]";
        port = 80;
      }
      {
        addr = "0.0.0.0";
        port = 443;
        ssl = true;
      }
      {
        addr = "[::0]";
        port = 443;
        ssl = true;
      }
      {
        addr = "0.0.0.0";
        port = 8448;
        ssl = true;
      }
      {
        addr = "[::0]";
        port = 8448;
        ssl = true;
      }
    ];

    locations = {
      # Hub / Root
      "/" = {
        proxyPass = "http://127.0.0.1:3553";
        proxyWebsockets = true;
      };

      # Matrix
      "/_matrix/" = {
        proxyPass = "http://127.0.0.1:6167";
      };

      "= /.well-known/matrix/server" = {
        return = ''200 '{"m.server":"matrix.riaru.xyz:443"}' '';
        extraConfig = ''
          default_type application/json;
          add_header Cache-Control "public, max-age=3600";
        '';
      };
      "= /.well-known/matrix/client" = {
        return = ''200 '{"m.homeserver":{"base_url":"https://matrix.riaru.xyz"},"org.matrix.msc4143.rtc_foci":[{"type":"livekit","livekit_service_url":"https://livekit.riaru.xyz/livekit/jwt"}]}' '';
        extraConfig = ''
          default_type application/json;
          add_header Access-Control-Allow-Origin "*";
          add_header Cache-Control "public, max-age=3600";
        '';
      };

      # Mastodon
      "= /.well-known/webfinger" = {
        return = "301 https://mas.riaru.xyz$request_uri";
        extraConfig = ''
          add_header Access-Control-Allow-Origin "*";
        '';
      };
      "= /.well-known/host-meta" = {
        return = "301 https://mas.riaru.xyz$request_uri";
      };
      "= /.well-known/nodeinfo" = {
        return = "301 https://mas.riaru.xyz$request_uri";
      };
    };
  };
}
