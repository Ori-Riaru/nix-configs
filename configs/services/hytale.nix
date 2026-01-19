{pkgs, ...}: {
  # Launch Server
  # cd /data/hytale/Server
  # ./start-server.sh

  networking.firewall.allowedUDPPorts = [5520];
  environment.systemPackages = with pkgs; [
    openjdk25
    screen
  ];
}
