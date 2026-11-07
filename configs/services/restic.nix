# mount backups by: sudo restic-home mount --allow-other /mnt/restic
{
  config,
  lib,
  pkgs,
  ...
}:
{
  systemd.tmpfiles.rules = [
    "d /mnt/bulk/data/Backups/restic/home 0755 root root -"
    "d /mnt/bulk/data/Backups/restic/nextcloud 0755 root root -"
    "d /mnt/bulk/data/Backups/restic/mastodon 0755 root root -"
    "d /mnt/bulk/data/Backups/restic/matrix 0755 root root -"
    "d /mnt/bulk/data/Backups/restic/jellyfin 0755 root root -"
    "d /mnt/bulk/data/Backups/restic/minecraft 0755 root root -"
    "d /mnt/bulk/data/Backups/restic/palworld 0755 root root -"
    "d /mnt/bulk/data/Backups/restic/system 0755 root root -"
    "d /mnt/bulk/data/Backups/restic/hytale 0755 root root -"
    "d /mnt/bulk/data/Backups/restic/copyparty 0755 root root -"
  ];

  environment.variables = {
    RESTIC_REPOSITORY = "/mnt/bulk/data/Backups/restic/home";
    RESTIC_PASSWORD_FILE = config.sops.secrets.restic_pass.path;
  };

  services.restic.backups = {
    home = {
      repository = "/mnt/bulk/data/Backups/restic/home";
      initialize = true;
      paths = [
        "/data/nfs/riaru"
        "/home/riaru"
      ];
      exclude = [
        "**/.cache"
        "**/Trash"
      ];
      passwordFile = config.sops.secrets.restic_pass.path;
      pruneOpts = [
        "--keep-daily 14"
        "--keep-weekly 4"
        "--keep-monthly 12"
        "--keep-yearly 10"
      ];
      timerConfig = {
        OnCalendar = "Mon,Wed,Fri 04:00:00";
        Persistent = true;
      };
    };

    nextcloud = lib.mkIf config.services.nextcloud.enable {
      repository = "/mnt/bulk/data/Backups/restic/nextcloud";
      initialize = true;
      paths = [
        "/data/nextcloud"
        "/var/backup/nextcloud"
      ];
      backupPrepareCommand = ''
        mkdir -p /var/backup/nextcloud
        ${config.services.mysql.package}/bin/mariadb-dump --single-transaction --quick --routines --triggers --all-databases > /var/backup/nextcloud/mysql.sql
      '';
      backupCleanupCommand = "rm -f /var/backup/nextcloud/mysql.sql";
      passwordFile = config.sops.secrets.restic_pass.path;
      pruneOpts = [
        "--keep-weekly 8"
        "--keep-monthly 12"
        "--keep-yearly 10"
      ];
      timerConfig = {
        OnCalendar = "Tue,Fri 04:30:00";
        Persistent = true;
      };
    };

    mastodon = {
      repository = "/mnt/bulk/data/Backups/restic/mastodon";
      initialize = true;
      paths = [
        "/var/lib/mastodon"
        "/var/backup/mastodon"
      ];
      backupPrepareCommand = ''
        mkdir -p /var/backup/mastodon
        ${pkgs.util-linux}/bin/runuser -u postgres -- ${config.services.postgresql.package}/bin/pg_dump mastodon > /var/backup/mastodon/mastodon.sql
        ${pkgs.util-linux}/bin/runuser -u postgres -- ${config.services.postgresql.package}/bin/pg_dumpall --globals-only > /var/backup/mastodon/globals.sql
      '';
      backupCleanupCommand = "rm -f /var/backup/mastodon/*.sql";
      passwordFile = config.sops.secrets.restic_pass.path;
      pruneOpts = [
        "--keep-weekly 4"
        "--keep-monthly 12"
        "--keep-yearly 10"
      ];
      timerConfig = {
        OnCalendar = "Mon,Thu 05:00:00";
        Persistent = true;
      };
    };

    matrix = {
      repository = "/mnt/bulk/data/Backups/restic/matrix";
      initialize = true;
      # continuwuity runs as DynamicUser, so /var/lib/continuwuity is a symlink
      # to /var/lib/private/continuwuity. restic does not follow symlinks, so the
      # real path must be given or the backup only stores a dangling symlink.
      paths = [ "/var/lib/private/continuwuity" ];
      passwordFile = config.sops.secrets.restic_pass.path;
      pruneOpts = [
        "--keep-weekly 4"
        "--keep-monthly 12"
        "--keep-yearly 10"
      ];
      timerConfig = {
        OnCalendar = "*-*-* 03:30:00";
        Persistent = true;
      };
    };

    # jellyfin + *arr stack. prowlarr and jellyseerr use DynamicUser, so their
    # /var/lib paths are symlinks to /var/lib/private; the real paths are used
    # for the same reason as the matrix job above.
    jellyfin = {
      repository = "/mnt/bulk/data/Backups/restic/jellyfin";
      initialize = true;
      paths = [
        "/var/lib/jellyfin"
        "/var/lib/sonarr"
        "/var/lib/radarr"
        "/var/lib/lidarr"
        "/var/lib/private/prowlarr"
        "/var/lib/private/jellyseerr"
      ];
      passwordFile = config.sops.secrets.restic_pass.path;
      pruneOpts = [
        "--keep-weekly 4"
        "--keep-monthly 12"
        "--keep-yearly 10"
      ];
      timerConfig = {
        OnCalendar = "Wed 05:30:00";
        Persistent = true;
      };
    };

    minecraft = {
      repository = "/mnt/bulk/data/Backups/restic/minecraft";
      initialize = true;
      paths = [
        "/data/minecraft"
        "/data/vanilla-june-2026"
      ];
      passwordFile = config.sops.secrets.restic_pass.path;
      pruneOpts = [
        "--keep-daily 7"
        "--keep-weekly 4"
        "--keep-monthly 12"
        "--keep-yearly 10"
      ];
      timerConfig = {
        OnCalendar = "*-*-* 03:00:00";
        Persistent = true;
      };
    };

    palworld = {
      repository = "/mnt/bulk/data/Backups/restic/palworld";
      initialize = true;
      paths = [ "/data/palworld" ];
      passwordFile = config.sops.secrets.restic_pass.path;
      pruneOpts = [
        "--keep-weekly 4"
        "--keep-monthly 12"
        "--keep-yearly 10"
      ];
      timerConfig = {
        OnCalendar = "Fri 05:30:00";
        Persistent = true;
      };
    };

    hytale = {
      repository = "/mnt/bulk/data/Backups/restic/hytale";
      initialize = true;
      paths = [ "/data/hytale" ];
      passwordFile = config.sops.secrets.restic_pass.path;
      pruneOpts = [
        "--keep-weekly 4"
        "--keep-monthly 12"
        "--keep-yearly 10"
      ];
      timerConfig = {
        OnCalendar = "Sun 05:00:00";
        Persistent = true;
      };
    };

    copyparty = {
      repository = "/mnt/bulk/data/Backups/restic/copyparty";
      initialize = true;
      paths = [
        "/data/copyparty"
        "/var/lib/copyparty"
      ];
      passwordFile = config.sops.secrets.restic_pass.path;
      pruneOpts = [
        "--keep-weekly 4"
        "--keep-monthly 12"
        "--keep-yearly 10"
      ];
      timerConfig = {
        OnCalendar = "Sun 05:30:00";
        Persistent = true;
      };
    };

    system = {
      repository = "/mnt/bulk/data/Backups/restic/system";
      initialize = true;
      paths = [
        # "/etc/ssh"
        # "/etc/nixos"
        # "/var/lib/acme"
        # "/var/lib/nixos"
        # "/var/lib/AccountsService"
        # "/var/lib/tailscale"
        # "/var/lib/hydroxide"
        # "/var/lib/private/hydroxide"
        # "/var/lib/livekit"
        # "/var/lib/private/derper"
        # "/var/lib/private/factorio"
        # "/var/lib/samba"
        # "/var/lib/hass"
        # "/var/lib/redis-mastodon"
        # "/var/lib/redis-nextcloud"
        # "/var/lib/redis-immich"
        "/etc"
        "/var/lib"
        "/srv"
        "/data/smb"
        "/home/riaru/.ssh"
        "/home/riaru/.config/sops"
      ];
      exclude = [
        "/var/lib/swapfile"
        "/var/lib/mysql"
      ];
      passwordFile = config.sops.secrets.restic_pass.path;
      pruneOpts = [
        "--keep-weekly 8"
        "--keep-monthly 12"
        "--keep-yearly 10"
      ];
      timerConfig = {
        OnCalendar = "Tue,Sat 05:00:00";
        Persistent = true;
      };
    };
  };
}
