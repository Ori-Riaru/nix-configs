{...}: {
  services.crowdsec = {
    enable = true;

    extraGroups = ["systemd-journal"];
    readOnlyPaths = ["/var/log/nginx"];

    hub.collections = [
      "crowdsecurity/linux"
      "crowdsecurity/sshd"
      "crowdsecurity/nginx"
      "LePresidente/jellyfin"
      "crowdsecurity/nextcloud"
      "Dominic-Wagner/vaultwarden"
    ];

    settings = {
      config.api.server.listen_uri = "127.0.0.1:60606";

      parsers.s02Enrich = [
        {
          name = "riaru/whitelists";
          description = "Whitelist LAN and Tailscale";
          whitelist = {
            reason = "trusted networks";
            ip = [
              "127.0.0.1"
              "::1"
              "192.168.0.0/16"
              "100.64.0.0/10"
            ];
          };
        }
      ];

      acquisitions = [
        {
          filenames = ["/var/log/nginx/access.log"];
          labels.type = "nginx";
        }
      ];
    };
  };

  services.crowdsec-firewall-bouncer = {
    enable = true;
    settings.update_frequency = "10s";
  };
}
