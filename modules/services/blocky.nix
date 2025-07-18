{settings, ...}: {
  # MANUAL: Set router default dns to blocky server ip
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
        clientGroupsBlock = {
          default = ["ads"];
        };
      };
      customDNS = {
        mapping = {
          "my.v0id.nl" = "${settings.serverLocalIP}";
          "router.lan" = "192.168.1.41";
          "modem.lan" = "192.168.1.254";
          "fujin" = "${settings.serverLocalIP}";
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
}
