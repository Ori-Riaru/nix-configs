{pkgs, ...}: {
  services.gvfs.enable = true;

  # For mount.cifs, required unless domain name resolution is not needed.
  environment.systemPackages = with pkgs; [
    cifs-utils
    lxqt.lxqt-policykit
  ];

  fileSystems."/mnt/share/public" = {
    device = "//192.168.2.22/public";
    fsType = "cifs";
    options = let
      automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
    in ["${automount_opts},guest,username=guest,password="];
  };

  systemd.tmpfiles.rules = [
    "d /mnt/share 0755 riaru riaru -"
    "d /mnt/share/public 0755 riaru riaru -"
    "d /mnt/share/private 0755 riaru riaru -"
  ];
}
