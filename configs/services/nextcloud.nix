{
  config,
  settings,
  pkgs,
  ...
}: {
  networking.firewall.allowedTCPPorts = [80 443];

  security.acme = {
    acceptTerms = true;
    defaults.email = settings.email;
  };

  services.nginx.virtualHosts.${config.services.nextcloud.hostName} = {
    forceSSL = true;
    enableACME = true;
  };

  services.nextcloud = {
    enable = true;

    # MANUAL update required when new version available.
    package = pkgs.nextcloud33;

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
      trusted_domains = [config.services.nextcloud.hostName];
    };
    extraAppsEnable = true;
    extraApps = {
      # MANUAL update required when new version
      # List of all nextloud apps:
      #    https://apps.nextcloud.com/
      # Information about apps:
      #    https://github.com/helsinki-systems/nc4nix

      # theming_customcss = pkgs.fetchNextcloudApp {
      #   url = "https://github.com/nextcloud/theming_customcss/releases/download/v1.20.0/theming_customcss.tar.gz";
      #   sha256 = "sha256-tDU6GIGX5PFr6+iBYjUl4iGcZKUmc/3MUBt5xD561uw=";
      #   license = "gpl3";
      # };

      # duplicatefinder = pkgs.fetchNextcloudApp {
      #   sha256 = "sha256-VoA0jHS2Nkfz/c1UKSKFTdzFGbXV2/chhWy9vbGYOSc=";
      #   url = "https://github.com/eldertek/duplicatefinder/releases/download/v1.7.3/duplicatefinder-v1.7.3.tar.gz";
      #   license = "gpl3";
      # };

      side_menu = pkgs.fetchNextcloudApp {
        url = "https://gitnet.fr/deblan/side_menu/releases/download/v5.2.2/side_menu_v5.2.2.tar.gz";
        sha256 = "sha256-skUCzklTCKmUsCLWrUAQA2xQXE/KpoRz9fQ2H65sf4I=";
        license = "gpl3";
      };

      mail = pkgs.fetchNextcloudApp {
        url = "https://github.com/nextcloud-releases/mail/releases/download/v5.7.5/mail-v5.7.5.tar.gz";
        sha256 = "sha256-kUOJkC1l0Q/XTXLEXwdOk69IH/xg0VzU8jMhF+K3wpI=";
        license = "gpl3";
      };

      contacts = pkgs.fetchNextcloudApp {
        url = "https://github.com/nextcloud-releases/contacts/releases/download/v8.4.1/contacts-v8.4.1.tar.gz";
        sha256 = "sha256-/RNCZGmPJ2Feh506D5xIw09vX27H0IEVz+ipn7V7MfM=";
        license = "gpl3";
      };

      deck = pkgs.fetchNextcloudApp {
        url = "https://github.com/nextcloud-releases/deck/releases/download/v1.17.0/deck-v1.17.0.tar.gz";
        sha256 = "sha256-AG4Ef7Jhl8OV7Ddd6heHeEzay62DXEd86lOk9co/tXc=";
        license = "gpl3";
      };

      tasks = pkgs.fetchNextcloudApp {
        url = "https://github.com/nextcloud/tasks/releases/download/v0.17.1/tasks.tar.gz";
        sha256 = "sha256-I5QdNavgv74FSuXwFWNz/++LOY9Z8kNZhEKf2k118L8=";
        license = "gpl3";
      };

      calendar = pkgs.fetchNextcloudApp {
        url = "https://github.com/nextcloud-releases/calendar/releases/download/v6.2.1/calendar-v6.2.1.tar.gz";
        sha256 = "sha256-DCitIgvlHfRGYqLJXhQ6UOY5vVmhbUiUQfBXkysc5Ps=";
        license = "gpl3";
      };

      forms = pkgs.fetchNextcloudApp {
        url = "https://github.com/nextcloud-releases/forms/releases/download/v5.2.5/forms-v5.2.5.tar.gz";
        sha256 = "sha256-hiDhtnWtscpI+ICOk1nulJoCLovnBv8YBtso/CtJjH4=";
        license = "gpl3";
      };

      # corners = pkgs.fetchNextcloudApp {
      #   url = "https://github.com/OliverParoczai/nextcloud-unroundedcorners/releases/download/v1.1.5/unroundedcorners-v1.1.5.tar.gz";
      #   sha256 = "sha256-0+fOJnPsuengy8TPzTKizDnDXTlZStalFDOv+dFlRgc=";
      #   license = "gpl3";
      # };
    };
  };
}
