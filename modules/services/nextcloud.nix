{pkgs, ...}: {
  networking.firewall.allowedTCPPorts = [80 443];

  services.nextcloud = {
    enable = false;

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
    # Apps
    extraAppsEnable = true;
    extraApps = {
      # List of all nextloud apps:
      #    https://apps.nextcloud.com/
      # Information about apps:
      #    https://github.com/helsinki-systems/nc4nix

      theming_customcss = pkgs.fetchNextcloudApp {
        sha256 = "sha256-RxpRRxdL78XADTpi2h2GOgJHksouiI8INtGyy7oMr/E=";
        url = "https://github.com/nextcloud/theming_customcss/releases/download/v1.18.0/theming_customcss.tar.gz";
        license = "gpl3";
      };

      duplicatefinder = pkgs.fetchNextcloudApp {
        sha256 = "sha256-VoA0jHS2Nkfz/c1UKSKFTdzFGbXV2/chhWy9vbGYOSc=";
        url = "https://github.com/eldertek/duplicatefinder/releases/download/v1.7.3/duplicatefinder-v1.7.3.tar.gz";
        license = "gpl3";
      };

      side_menu = pkgs.fetchNextcloudApp {
        sha256 = "sha256-Ho7DB+yxUJ5beEa82zVED1MXeUHVNECs/7x+UPRRQKs=";
        url = "https://gitnet.fr/deblan/side_menu/releases/download/5.1.1/side_menu_v5.1.1.tar.gz";
        license = "gpl3";
      };

      mail = pkgs.fetchNextcloudApp {
        sha256 = "sha256-P2LeJOjCR6ufq26gz4aK/Xy359vwnD2TZJodn/YfXcU=";
        url = "https://github.com/nextcloud-releases/mail/releases/download/v5.1.3/mail-v5.1.3.tar.gz";
        license = "gpl3";
      };

      calendar = pkgs.fetchNextcloudApp {
        sha256 = "sha256-vsqyTtHDTjB4POwQyDtlAPnb8nBQw0ZTBnBUqP4Kw9A=";
        url = "https://github.com/nextcloud-releases/calendar/releases/download/v5.3.2/calendar-v5.3.2.tar.gz";
        license = "gpl3";
      };

      music = pkgs.fetchNextcloudApp {
        sha256 = "sha256-h83Xc292/NQPWOTRIbUSgqHUH/Sp4fYJ8GAHSiJWHP0=";
        url = "https://github.com/owncloud/music/releases/download/v2.1.4/music_2.1.4_for_nextcloud.tar.gz";
        license = "gpl3";
      };

      forms = pkgs.fetchNextcloudApp {
        sha256 = "sha256-t4/1Rq99VH+g43zLcms5P714bSYv5h6RTaI4Q7jvD+Y=";
        url = "https://github.com/nextcloud-releases/forms/releases/download/v5.1.0/forms-v5.1.0.tar.gz";
        license = "gpl3";
      };
    };
  };
}
