{
  pkgs,
  settings,
  ...
}: {
  services.gvfs.enable = true;

  fileSystems."/mnt/smb/riaru" = {
    device = "//${settings.serverLocalIP}/riaru";
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
    "d /mnt/smb 0755 riaru users -"
    "d /mnt/smb/riaru 0755 riaru users -"
  ];
}
