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
    package = pkgs.nextcloud34;

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
      "simpleSignUpLink.shown" = false;
    };
    extraAppsEnable = true;
    extraApps = {
      # MANUAL update required when new version
      # List of all nextloud apps:
      #    https://apps.nextcloud.com/
      # Information about apps:
      #    https://github.com/helsinki-systems/nc4nix

      theming_customcss = pkgs.fetchNextcloudApp {
        url = "https://github.com/nextcloud-releases/theming_customcss/releases/download/v1.22.0/theming_customcss-v1.22.0.tar.gz";
        sha256 = "sha256-CUE7rV1yVIzRH8mogwGxuMB2Che3vRPbadTz0o3tgTE=";
        license = "agpl3Plus";
      };

      # side_menu = pkgs.fetchNextcloudApp {
      #   url = "https://gitnet.fr/deblan/side_menu/releases/download/v5.2.2/side_menu_v5.2.2.tar.gz";
      #   sha256 = "sha256-skUCzklTCKmUsCLWrUAQA2xQXE/KpoRz9fQ2H65sf4I=";
      #   license = "gpl3";
      # };

      # epubviewer = pkgs.fetchNextcloudApp {
      #   url = "https://github.com/devnoname120/epubviewer/releases/download/1.9.7/epubviewer-1.9.7.tar.gz";
      #   sha256 = "sha256-/w/m4ddbhyHtFtiZo/TMhx5A6xPWownToGg3KI992Gk=";
      #   license = "gpl3";
      # };

      mail = pkgs.fetchNextcloudApp {
        url = "https://github.com/nextcloud-releases/mail/releases/download/v5.11.5/mail-v5.11.5.tar.gz";
        sha256 = "sha256-WNrLQWrH36G3EcelwV1QLKLV+fC0UlOgWX6znSnq+IE=";
        license = "gpl3";
      };

      contacts = pkgs.fetchNextcloudApp {
        url = "https://github.com/nextcloud-releases/contacts/releases/download/v8.8.1/contacts-v8.8.1.tar.gz";
        sha256 = "sha256-KuPtvZDtzESrjC0xcmYeXRlIIFqgpNPnEvxm0lATKfc=";
        license = "gpl3";
      };

      deck = pkgs.fetchNextcloudApp {
        url = "https://github.com/nextcloud-releases/deck/releases/download/v1.18.4/deck-v1.18.4.tar.gz";
        sha256 = "sha256-2KcGPN1iJdGdwogzpxcFBsrG9eQpoCDiO82MLYMVvDk=";
        license = "gpl3";
      };

      tasks = pkgs.fetchNextcloudApp {
        url = "https://github.com/nextcloud/tasks/releases/download/v0.18.1/tasks.tar.gz";
        sha256 = "sha256-DJiNUFMcm/okbmwx8/lTaa3eFim6cNFRlJFatW4kaHs=";
        license = "gpl3";
      };

      calendar = pkgs.fetchNextcloudApp {
        url = "https://github.com/nextcloud-releases/calendar/releases/download/v6.5.4/calendar-v6.5.4.tar.gz";
        sha256 = "sha256-Z8d3puqXRAnp0ijCP8YPK+jmddN2UxtrGxJfLwNlc40=";
        license = "gpl3";
      };

      forms = pkgs.fetchNextcloudApp {
        url = "https://github.com/nextcloud-releases/forms/releases/download/v5.3.6/forms-v5.3.6.tar.gz";
        sha256 = "sha256-f+LNscBPLdFI1t0VivnivlcG0HIWrqlQk7pYDcfGWIA=";
        license = "gpl3";
      };

      # corners = pkgs.fetchNextcloudApp {
      #   url = "https://github.com/OliverParoczai/nextcloud-unroundedcorners/releases/download/v1.1.5/unroundedcorners-v1.1.5.tar.gz";
      #   sha256 = "sha256-0+fOJnPsuengy8TPzTKizDnDXTlZStalFDOv+dFlRgc=";
      #   license = "gpl3";
      # };

      # duplicatefinder = pkgs.fetchNextcloudApp {
      #   sha256 = "sha256-VoA0jHS2Nkfz/c1UKSKFTdzFGbXV2/chhWy9vbGYOSc=";
      #   url = "https://github.com/eldertek/duplicatefinder/releases/download/v1.7.3/duplicatefinder-v1.7.3.tar.gz";
      #   license = "gpl3";
      # };
    };
  };
}
