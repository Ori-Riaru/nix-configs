{
  config,
  lib,
  pkgs,
  settings,
  ...
}: {
  options.services.nfs-client = with lib; {
    serverIP = mkOption {
      type = types.str;
      description = "IP address of the NFS server";
      default = settings.serverLocalIP;
      example = "192.168.1.100";
    };
  };

  config = {
    boot.supportedFilesystems = ["nfs"];

    fileSystems = {
      "/mnt/nfs/riaru" = {
        device = "${config.services.nfs-client.serverIP}:/riaru";
        fsType = "nfs";
        options = [
          "nfsvers=4.2"
          "x-systemd.automount"
          "noauto"
          "x-systemd.idle-timeout=600"
          "x-systemd.mount-timeout=10"
          "soft"
          "timeo=50"
          "retrans=2"
          "rsize=131072"
          "wsize=131072"
        ];
      };
      "/mnt/nfs/bulk" = {
        device = "${config.services.nfs-client.serverIP}:/bulk";
        fsType = "nfs";
        options = [
          "nfsvers=4.2"
          "x-systemd.automount"
          "noauto"
          "x-systemd.idle-timeout=600"
          "x-systemd.mount-timeout=10"
          "soft"
          "timeo=50"
          "retrans=2"
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
  };
}
