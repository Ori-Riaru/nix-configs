{pkgs, ...}: {
  services.gvfs.enable = true;

  fileSystems."/mnt/smb/riaru" = {
    device = "//192.168.2.22/riaru";
    fsType = "cifs";
    options = [
      "noperm"
      "x-systemd.automount"
      "noauto"
      "x-systemd.idle-timeout=60"
      "x-systemd.device-timeout=5s"
      "x-systemd.mount-timeout=5s"
      "credentials=/etc/nixos/smb-secrets"
    ];
  };

  systemd.tmpfiles.rules = [
    "d /mnt/share 0755 riaru riaru -"
    "d /mnt/share/riaru 0755 riaru riaru -"
  ];
}
