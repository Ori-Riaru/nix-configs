# mount backups by: sudo restic-home mount --allow-other /mnt/restic
{config, ...}: {
  systemd.tmpfiles.rules = [
    "d /mnt/bulk/Backups/restic/home 0755 root root -"
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
  };
}
