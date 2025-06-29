{ config, pkgs, ... }:{
  services.nfs.server = {
    enable = true;
    extraNfsdConfig = "";
    
    exports = ''
      /export 192.168.2.0/24(rw,fsid=0,no_subtree_check)
      /export/riaru 192.168.2.0/24(rw,nohide,insecure,no_subtree_check,async)
    '';
  };

  systemd.tmpfiles.rules = [
    "d /export 0777 nobody nogroup -"
    "d /export/riaru 0755 riaru riaru -"
    "d /data 0755 root root -"
    "d /data/nfs 0755 root root -"
    "d /data/nfs/riaru 0755 riaru riaru -"
  ];

  fileSystems = {
    "/export/riaru" = {
      device = "/data/nfs/riaru";
      options = [ "bind" ];
    };
  };

  networking.firewall = {
    allowedTCPPorts = [ 2049 ];
  };
}