{pkgs, ...}: {
  networking.firewall.allowedTCPPorts = [80 443];

  environment.etc."nextcloud-admin-pass".text = builtins.readFile ../../secrets/password.txt;

  services.nextcloud = {
    enable = true;

    # Manual update required when new version available.
    package = pkgs.nextcloud31;

    hostName = "192.168.2.22";
    config.adminpassFile = "/etc/nextcloud-admin-pass";

    phpOptions."opcache.interned_strings_buffer" = "24";
    config.dbtype = "mysql";
    database.createLocally = true;
    configureRedis = true;
    maxUploadSize = "10G";

    settings = {
      maintenance_window_start = 4;
      default_phone_region = "CA";
    };

    # List of all nextloud apps: https://apps.nextcloud.com/
    extraAppsEnable = true;
    # MANUAL UPDATE
    extraApps = {
      theming_customcss = pkgs.fetchNextcloudApp {
        url = "https://github.com/nextcloud/theming_customcss/releases/download/v1.18.0/theming_customcss.tar.gz";
        sha256 = "sha256-RxpRRxdL78XADTpi2h2GOgJHksouiI8INtGyy7oMr/E=";
        license = "gpl3";
      };

      duplicatefinder = pkgs.fetchNextcloudApp {
        url = "https://github.com/eldertek/duplicatefinder/releases/download/v1.7.3/duplicatefinder-v1.7.3.tar.gz";
        sha256 = "sha256-VoA0jHS2Nkfz/c1UKSKFTdzFGbXV2/chhWy9vbGYOSc=";
        license = "gpl3";
      };

      side_menu = pkgs.fetchNextcloudApp {
        url = "https://gitnet.fr/deblan/side_menu/releases/download/5.1.1/side_menu_v5.1.1.tar.gz";
        sha256 = "sha256-Ho7DB+yxUJ5beEa82zVED1MXeUHVNECs/7x+UPRRQKs=";
        license = "gpl3";
      };

      mail = pkgs.fetchNextcloudApp {
        url = "https://github.com/nextcloud-releases/mail/releases/download/v5.1.3/mail-v5.1.3.tar.gz";
        sha256 = "sha256-P2LeJOjCR6ufq26gz4aK/Xy359vwnD2TZJodn/YfXcU=";
        license = "gpl3";
      };

      contacts = pkgs.fetchNextcloudApp {
        url = "https://github.com/nextcloud-releases/contacts/releases/download/v7.1.3/contacts-v7.1.3.tar.gz";
        sha256 = "sha256-uT1QOZpuKvsrnZWYbaQUhUdM49xdIivotFe6FAz330I=";
        license = "gpl3";
      };

      calendar = pkgs.fetchNextcloudApp {
        url = "https://github.com/nextcloud-releases/calendar/releases/download/v5.3.2/calendar-v5.3.2.tar.gz";
        sha256 = "sha256-vsqyTtHDTjB4POwQyDtlAPnb8nBQw0ZTBnBUqP4Kw9A=";
        license = "gpl3";
      };

      music = pkgs.fetchNextcloudApp {
        url = "https://github.com/owncloud/music/releases/download/v2.1.4/music_2.1.4_for_nextcloud.tar.gz";
        sha256 = "sha256-h83Xc292/NQPWOTRIbUSgqHUH/Sp4fYJ8GAHSiJWHP0=";
        license = "gpl3";
      };

      forms = pkgs.fetchNextcloudApp {
        url = "https://github.com/nextcloud-releases/forms/releases/download/v5.1.0/forms-v5.1.0.tar.gz";
        sha256 = "sha256-t4/1Rq99VH+g43zLcms5P714bSYv5h6RTaI4Q7jvD+Y=";
        license = "gpl3";
      };
    };
  };
}
