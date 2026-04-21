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
      "${settings.nasPath}" = {
        device = "${config.services.nfs-client.serverIP}:/riaru";
        fsType = "nfs";
        options = [
          "nfsvers=4.2"
          "nconnect=16"
          "_netdev"
          "x-systemd.automount"
          "noauto"
          "x-systemd.idle-timeout=600"
          "x-systemd.mount-timeout=15"
          "timeo=150"
          "rsize=1048576"
          "wsize=1048576"
        ];
      };
      "/mnt/nfs/bulk" = {
        device = "${config.services.nfs-client.serverIP}:/bulk";
        fsType = "nfs";
        options = [
          "nfsvers=4.2"
          "nconnect=16"
          "_netdev"
          "x-systemd.automount"
          "noauto"
          "x-systemd.idle-timeout=600"
          "x-systemd.mount-timeout=15"
          "timeo=150"
          "rsize=1048576"
          "wsize=1048576"
        ];
      };
    };

    systemd.tmpfiles.rules = [
      "d /mnt/nfs 0755 root root -"
      "d ${settings.nasPath} 0755 riaru users -"
      "d /mnt/nfs/bulk 0755 riaru users -"
    ];

    environment.systemPackages = with pkgs; [
      nfs-utils
    ];
  };
}
