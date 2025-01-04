{pkgs, ...}: {
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  networking.firewall = {
    allowedTCPPorts = [8211 27015 27016 25575];
    allowedUDPPorts = [8211 27015 27016 25575];
  };

  environment.systemPackages = with pkgs; [
    steamcmd
    screen
  ];
}
