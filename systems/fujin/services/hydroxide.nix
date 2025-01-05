{pkgs, ...}: {
  networking.firewall.allowedTCPPorts = [1143 1025];
  environment.systemPackages = with pkgs; [
    hydroxide
  ];
}
