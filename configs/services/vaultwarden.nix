{
  config,
  settings,
  ...
}: {
  services.vaultwarden = {
    enable = true;
    backupDir = "/mnt/bulk/data/Backups/vaultwarden";
    environmentFile = config.sops.templates."vaultwarden.env".path;
    config = {
      # Networking
      DOMAIN = "https://vault.riaru.xyz";
      ROCKET_ADDRESS = "127.0.0.1";
      ROCKET_PORT = 8222;

      # Email
      SMTP_HOST = "mail.infomaniak.com";
      SMTP_PORT = 587;
      SMTP_SECURITY = "starttls";
      SMTP_USERNAME = "ori@riaru.xyz";
      SMTP_FROM = "ori@riaru.xyz";
      SMTP_FROM_NAME = "Vaultwarden";

      # General
      SIGNUPS_ALLOWED = false;
      PASSWORD_HINTS_ALLOWED = false;
      TRASH_AUTO_DELETE_DAYS = 30;
      LOG_LEVEL = "warn";
    };
  };

  services.nginx.virtualHosts = {
    "vault.riaru.xyz" = {
      forceSSL = true;
      enableACME = true;
      extraConfig = ''
        add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
        client_max_body_size 100m;
      '';
      locations."/" = {
        proxyPass = "http://127.0.0.1:${toString config.services.vaultwarden.config.ROCKET_PORT}";
        proxyWebsockets = true;
      };
      locations."/admin" = {
        proxyPass = "http://127.0.0.1:${toString config.services.vaultwarden.config.ROCKET_PORT}";
        proxyWebsockets = true;
        extraConfig = ''
          allow 127.0.0.1;
          allow ::1;
          allow 192.168.1.0/24;
          allow 100.64.0.0/10;
          allow fd7a:115c:a1e0::/48;
          deny all;
        '';
      };
    };
  };

  sops.templates."vaultwarden.env" = {
    content = ''
      ADMIN_TOKEN=${config.sops.placeholder.vaultwarden_admin_token}
      SMTP_PASSWORD=${config.sops.placeholder.vaultwarden_smtp_pass}
    '';
    owner = config.users.users.vaultwarden.name;
    group = config.users.groups.vaultwarden.name;
    mode = "0400";
  };
}
