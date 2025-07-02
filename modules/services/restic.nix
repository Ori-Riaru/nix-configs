# mount backups by: sudo restic-home mount --allow-other /mnt/restic
{pkgs, ...}: {
	 systemd.tmpfiles.rules = [
	    "d /mnt/bulk/Backups/restic/home 0755 root root -"
  	];

  	environment.variables = {
  		  RESTIC_REPOSITORY = "/mnt/bulk/data/Backups/restic/home";
  		  RESTIC_PASSWORD_FILE = "/etc/nixos/restic-password";
  	};	

	services.restic.backups = {
		home = {
			repository = "/mnt/bulk/data/Backups/restic/home";
			initialize = true;
			paths = [ "/data/nfs/riaru" ];
			exclude = [ ];
			passwordFile = "/etc/nixos/restic-password";
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
