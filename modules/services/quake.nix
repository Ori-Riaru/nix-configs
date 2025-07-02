{pkgs, ...}: {
  networking.firewall = {
    allowedTCPPorts = [ 26000 ];
    allowedUDPPorts = [ 26000 ];
  };
}
