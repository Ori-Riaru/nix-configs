{
  config,
  pkgs,
  ...
}: {
  networking.firewall.allowedTCPPorts = [80 443];

  security.acme = {
    acceptTerms = true;
    defaults.email = "ori-riaru@proton.me";
    defaults.enableDebugLogs = true;
  };

  services.nginx.virtualHosts.${config.services.nextcloud.hostName} = {
    forceSSL = true;
    enableACME = true;
  };

  services.nextcloud = {
    enable = true;

    # MANUAL update required when new version available.
    package = pkgs.nextcloud32;

    hostName = "riaru.home.kg";
    https = true;
    config.adminpassFile = config.sops.secrets.nextcloud_admin_pass.path;

    home = "/data/nextcloud";

    phpOptions."opcache.interned_strings_buffer" = "64";
    config.dbtype = "mysql";
    database.createLocally = true;
    configureRedis = true;
    maxUploadSize = "10G";

    settings = {
      maintenance_window_start = 4;
      default_phone_region = "CA";
      trusted_domains = ["riaru.home.kg"];
    };
    extraAppsEnable = true;
    extraApps = {
      # MANUAL update required when new version
      # List of all nextloud apps:
      #    https://apps.nextcloud.com/
      # Information about apps:
      #    https://github.com/helsinki-systems/nc4nix

      theming_customcss = pkgs.fetchNextcloudApp {
        url = "https://github.com/nextcloud/theming_customcss/releases/download/v1.19.0/theming_customcss.tar.gz";
        sha256 = "sha256-MsF+im9yCt7bRNIE8ait0wxcVzMXsHMNbp+IIzY/zJI=";
        license = "gpl3";
      };

      # duplicatefinder = pkgs.fetchNextcloudApp {
      #   sha256 = "sha256-VoA0jHS2Nkfz/c1UKSKFTdzFGbXV2/chhWy9vbGYOSc=";
      #   url = "https://github.com/eldertek/duplicatefinder/releases/download/v1.7.3/duplicatefinder-v1.7.3.tar.gz";
      #   license = "gpl3";
      # };

      side_menu = pkgs.fetchNextcloudApp {
        url = "https://gitnet.fr/deblan/side_menu/releases/download/v5.1.4-rc1/side_menu_v5.1.4-rc1.tar.gz";
        sha256 = "sha256-YWPKk/4M6eumqvNv9FEHG9equi0Egr/zB/cwNbR5efM=";
        license = "gpl3";
      };

      mail = pkgs.fetchNextcloudApp {
        url = "https://github.com/nextcloud-releases/mail/releases/download/v5.6.9/mail-v5.6.9.tar.gz";
        sha256 = "sha256-QjX1PcfQabxZ5NcMauU8G0xU3eaJs8lQHRJ0VM/m3BE=";
        license = "gpl3";
      };

      contacts = pkgs.fetchNextcloudApp {
        url = "https://github.com/nextcloud-releases/contacts/releases/download/v8.3.1/contacts-v8.3.1.tar.gz";
        sha256 = "sha256-hzeEPYIT1A60ucrehlk3PwpxzCRBdUDnH2OvG214WtY=";
        license = "gpl3";
      };

      deck = pkgs.fetchNextcloudApp {
        url = "https://github.com/nextcloud-releases/deck/releases/download/v1.16.3/deck-v1.16.3.tar.gz";
        sha256 = "sha256-RqY3onLYYw03MRWvZvwdO9QkleXB8Tz1q6OnkGqTsuY=";
        license = "gpl3";
      };

      tasks = pkgs.fetchNextcloudApp {
        url = "https://github.com/nextcloud/tasks/releases/download/v0.17.1/tasks.tar.gz";
        sha256 = "sha256-I5QdNavgv74FSuXwFWNz/++LOY9Z8kNZhEKf2k118L8=";
        license = "gpl3";
      };

      calendar = pkgs.fetchNextcloudApp {
        url = "https://github.com/nextcloud-releases/calendar/releases/download/v6.1.5/calendar-v6.1.5.tar.gz";
        sha256 = "sha256-bQczqQmVranqyBtd45i1OerpGiuZ7EofsD9gMYZU5FY=";
        license = "gpl3";
      };

      forms = pkgs.fetchNextcloudApp {
        url = "https://github.com/nextcloud-releases/forms/releases/download/v5.2.4/forms-v5.2.4.tar.gz";
        sha256 = "sha256-pPq35QtolbjBPiaILAvf7RA2uG3otiAyIRcU3AYwb5E=";
        license = "gpl3";
      };
    };
  };
}
