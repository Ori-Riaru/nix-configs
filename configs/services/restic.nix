# mount backups by: sudo restic-home mount --allow-other /mnt/restic
{config, ...}: {
  systemd.tmpfiles.rules = [
    "d /mnt/bulk/data/Backups/restic/home 0755 root root -"
    "d /mnt/bulk/data/Backups/restic/nextcloud 0755 root root -"
    "d /mnt/bulk/data/Backups/restic/mastodon 0755 root root -"
    "d /mnt/bulk/data/Backups/restic/matrix 0755 root root -"
    "d /mnt/bulk/data/Backups/restic/jellyfin 0755 root root -"
    "d /mnt/bulk/data/Backups/restic/minecraft 0755 root root -"
    "d /mnt/bulk/data/Backups/restic/palworld 0755 root root -"
  ];

  environment.variables = {
    RESTIC_REPOSITORY = "/mnt/bulk/data/Backups/restic/home";
    RESTIC_PASSWORD_FILE = config.sops.secrets.restic_pass.path;
  };

  services.restic.backups = {
    home = {
      repository = "/mnt/bulk/data/Backups/restic/home";
      initialize = true;
      paths = ["/data/nfs/riaru"];
      exclude = [];
      passwordFile = config.sops.secrets.restic_pass.path;
      pruneOpts = [
        "--keep-daily 7"
        "--keep-weekly 4"
        "--keep-monthly 12"
        "--keep-yearly 10"
      ];
      timerConfig = {
        OnCalendar = "daily";
        Persistent = true;
      };
    };

    # nextcloud = {
    #   repository = "/mnt/bulk/data/Backups/restic/nextcloud";
    #   initialize = true;
    #   paths = ["/data/nextcloud"];
    #   passwordFile = config.sops.secrets.restic_pass.path;
    #   pruneOpts = [
    #     "--keep-daily 7"
    #     "--keep-weekly 4"
    #     "--keep-monthly 12"
    #     "--keep-yearly 10"
    #   ];
    #   timerConfig = {
    #     OnCalendar = "daily";
    #     Persistent = true;
    #   };
    # };

    # mastodon = {
    #   repository = "/mnt/bulk/data/Backups/restic/mastodon";
    #   initialize = true;
    #   paths = ["/var/lib/mastodon"];
    #   passwordFile = config.sops.secrets.restic_pass.path;
    #   pruneOpts = [
    #     "--keep-daily 7"
    #     "--keep-weekly 4"
    #     "--keep-monthly 12"
    #     "--keep-yearly 10"
    #   ];
    #   timerConfig = {
    #     OnCalendar = "daily";
    #     Persistent = true;
    #   };
    # };

    matrix = {
      repository = "/mnt/bulk/data/Backups/restic/matrix";
      initialize = true;
      paths = ["/var/lib/continuwuity"];
      passwordFile = config.sops.secrets.restic_pass.path;
      pruneOpts = [
        "--keep-daily 7"
        "--keep-weekly 4"
        "--keep-monthly 12"
        "--keep-yearly 10"
      ];
      timerConfig = {
        OnCalendar = "daily";
        Persistent = true;
      };
    };

    jellyfin = {
      repository = "/mnt/bulk/data/Backups/restic/jellyfin";
      initialize = true;
      paths = ["/var/lib/jellyfin"];
      passwordFile = config.sops.secrets.restic_pass.path;
      pruneOpts = [
        "--keep-daily 7"
        "--keep-weekly 4"
        "--keep-monthly 12"
        "--keep-yearly 10"
      ];
      timerConfig = {
        OnCalendar = "daily";
        Persistent = true;
      };
    };

    minecraft = {
      repository = "/mnt/bulk/data/Backups/restic/minecraft";
      initialize = true;
      paths = ["/data/minecraft"];
      passwordFile = config.sops.secrets.restic_pass.path;
      pruneOpts = [
        "--keep-daily 7"
        "--keep-weekly 4"
        "--keep-monthly 12"
        "--keep-yearly 10"
      ];
      timerConfig = {
        OnCalendar = "daily";
        Persistent = true;
      };
    };

    palworld = {
      repository = "/mnt/bulk/data/Backups/restic/palworld";
      initialize = true;
      paths = ["/data/palworld"];
      passwordFile = config.sops.secrets.restic_pass.path;
      pruneOpts = [
        "--keep-daily 7"
        "--keep-weekly 4"
        "--keep-monthly 12"
        "--keep-yearly 10"
      ];
      timerConfig = {
        OnCalendar = "daily";
        Persistent = true;
      };
    };
  };
}
