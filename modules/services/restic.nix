
# mount backups using: sudo restic-home -r /data/restic/ -p /etc/nixos/restic-password mount --allow-other /home/riaru/restic
{pkgs, ...}: {
	 systemd.tmpfiles.rules = [
	    "d /data/restic 0755 root root -"
  	];	

	services.restic.backups = {
		home = {
			repository = "/data/restic";
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
