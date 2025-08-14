{ config, pkgs, ... }:{
  services.nfs.server = {
    enable = true;
    exports = ''
      /export 192.168.1.0/24(rw,fsid=0,no_subtree_check)
      /export/riaru 192.168.1.0/24(rw,nohide,insecure,no_subtree_check,async)
      /export/bulk 192.168.1.0/24(rw,nohide,insecure,no_subtree_check,async)
    '';
  };

  systemd.tmpfiles.rules = [
    "d /export 0755 nobody nogroup -"
    "d /export/riaru 0755 riaru users -"
    "d /export/bulk 0755 riaru users -"
    "d /data 0755 root root -"
    "d /data/nfs 0755 root root -"
    "d /data/nfs/riaru 0755 riaru users -"
    "d /mnt/bulk/data 0755 riaru users -"
  ];

  fileSystems = {
    "/export/riaru" = {
      device = "/data/nfs/riaru";
      options = [ "bind" ];
    };
    "/export/bulk" = {
	    device = "/mnt/bulk/data/";
	    options = [ "bind" ];
    };
  };

  networking.firewall = {
    allowedTCPPorts = [ 2049 ];
  };
}
