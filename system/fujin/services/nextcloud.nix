{
  pkgs,
  ...
}: {

  networking.firewall.allowedTCPPorts = [80 443];

  environment.etc."nextcloud-admin-pass".text = (builtins.readFile ./password.txt);

  services.nextcloud = {
    enable = true;

    # Manual update required when new version available.
    # Only update by 1 version at a time.
    package = pkgs.nextcloud30;

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
        url = "https://github.com/nextcloud/theming_customcss/releases/download/v1.16.0/theming_customcss.tar.gz";
        license = "gpl3";
      };

      duplicatefinder = pkgs.fetchNextcloudApp {
        sha256 = "sha256-CrAdWf6zSQLhNcB6BU/BLT42jclnEv3lS8j2J1hwoYM=";
        url = "https://github.com/eldertek/duplicatefinder/releases/download/v1.1.11/duplicatefinder-v1.1.11.tar.gz";
        license = "gpl3";
      };

      side_menu = pkgs.fetchNextcloudApp {
        sha256 = "sha256-EM9l9/lm39Ra9t1e8axtJcsDZQCRvdlPxqalISk/ezo=";
        url = "https://gitnet.fr/deblan/side_menu/releases/download/v3.13.0/side_menu_v3.13.0.tar.gz";
        license = "gpl3";
      };

      mail = pkgs.fetchNextcloudApp {
        sha256 = "sha256-4UlifHmX+3yX53RUIV9DVyj/nuttg25HNdaQjBQxXrs=";
        url = "https://github.com/nextcloud-releases/mail/releases/download/v3.7.2/mail-v3.7.2.tar.gz";
        license = "gpl3";
      };

      contacts = pkgs.fetchNextcloudApp {
        sha256 = "sha256-48ERJ9DQ9w71encT2XVvcVaV+EbthgExQliKO1sQ+1A=";
        url = "https://github.com/nextcloud-releases/contacts/releases/download/v6.0.0/contacts-v6.0.0.tar.gz";
        license = "gpl3";
      };

      calendar = pkgs.fetchNextcloudApp {
        sha256 = "sha256-hEsQpCtqabG+TiHdUa8aMUtQDM7uHMr7+XQZArSR3wI=";
        url = "https://github.com/nextcloud-releases/calendar/releases/download/v4.7.11/calendar-v4.7.11.tar.gz";
        license = "gpl3";
      };

      music = pkgs.fetchNextcloudApp {
        sha256 = "sha256-RnTyQYCbmkHDZhtonpvbKLUM3n93u53IhknyTrNGh9Y=";
        url = "https://github.com/owncloud/music/releases/download/v2.0.0/music_2.0.0_for_nextcloud.tar.gz";
        license = "gpl3";
      };

      forms = pkgs.fetchNextcloudApp {
        sha256 = "sha256-OqqorHVWCDicQKnTxEJjeXzDrsj98vWvtWYyaRmDsUs=";
        url = "https://github.com/nextcloud-releases/forms/releases/download/v4.2.4/forms-v4.2.4.tar.gz";
        license = "gpl3";
      };
    };
  };

  #services.nginx.virtualHosts.${config.services.nextcloud.hostName} = {
  #  forceSSL = true;
  #  enableACME = true;
  #};
  #
  #security.acme = {
  #  acceptTerms = true;
  #  certs = {
  #    ${config.services.nextcloud.hostName}.email = "riaruazaki@proton.me";
  #  };
  #};
}
