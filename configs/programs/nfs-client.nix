{
  pkgs,
  settings,
  ...
}: {
  boot.supportedFilesystems = ["nfs"];

  fileSystems = {
    "/mnt/nfs/riaru" = {
      device = "${settings.serverLocalIP}:/riaru";
      fsType = "nfs";
      options = [
        "nfsvers=4.2"
        "x-systemd.automount"
        "noauto"
        "x-systemd.idle-timeout=600"
        "rsize=131072"
        "wsize=131072"
      ];
    };
    "/mnt/nfs/bulk" = {
      device = "${settings.serverLocalIP}:/bulk";
      fsType = "nfs";
      options = [
        "nfsvers=4.2"
        "x-systemd.automount"
        "noauto"
        "x-systemd.idle-timeout=600"
        "rsize=131072"
        "wsize=131072"
      ];
    };
  };

  systemd.tmpfiles.rules = [
    "d /mnt/nfs 0755 root root -"
    "d /mnt/nfs/riaru 0755 riaru users -"
    "d /mnt/nfs/bulk 0755 riaru users -"
  ];

  environment.systemPackages = with pkgs; [
    nfs-utils
  ];
}
