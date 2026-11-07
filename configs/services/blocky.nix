{settings, ...}: {
  # MANUAL: Set router default dns to server ip
  services.blocky = {
    enable = true;
    settings = {
      ports.dns = 53;
      upstreams.groups.default = [
        "9.9.9.9"
        "8.8.8.8"
        "1.1.1.1"
      ];
      bootstrapDns = {
        upstream = "9.9.9.9";
        ips = ["9.9.9.9"];
      };
      blocking = {
        denylists = {
          ads = [
            "https://raw.githubusercontent.com/hagezi/dns-blocklists/main/wildcard/pro.txt"
          ];
        };
        allowlists = {
          ads = [
          ];
        };
        clientGroupsBlock = {
          default = ["ads"];
          "192.168.1.75" = [];
        };
        loading = {
          refreshPeriod = "24h";
        };
      };
      customDNS = {
        mapping = {
          "riaru.xyz" = "${settings.serverLocalIP}";
          "ori.riaru.xyz" = "${settings.serverLocalIP}";
          "jellyfin.riaru.xyz" = "${settings.serverLocalIP}";
          "cloud.riaru.xyz" = "${settings.serverLocalIP}";
          "matrix.riaru.xyz" = "${settings.serverLocalIP}";
          "livekit.riaru.xyz" = "${settings.serverLocalIP}";
          "mas.riaru.xyz" = "${settings.serverLocalIP}";
          "derp.riaru.xyz" = "${settings.serverLocalIP}";
          "mov.riaru.xyz" = "${settings.serverLocalIP}";

          # Old free dns
          "riaru.undo.it" = "${settings.serverLocalIP}";
          "riaru.home.kg" = "${settings.serverLocalIP}";

          # Local Only
          "router.box" = "192.168.1.41";
          "kumo.box" = "100.103.185.35";
          "lain.box" = "100.127.40.4";
          "slate.box" = "100.95.62.42";
        };
      };
      caching = {
        minTime = "5m";
        maxTime = "30m";
        prefetching = true;
      };
    };
  };
  networking.firewall.allowedUDPPorts = [53];
  services.resolved.settings.Resolve.DNSStubListener = false;
  networking.nameservers = ["127.0.0.1"];
}
