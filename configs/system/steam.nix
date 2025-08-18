{pkgs, ...}: {
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    protontricks.enable = true;
  };
 
  programs.steam.extraCompatPackages = with pkgs; [
    proton-ge-bin
  ];

  programs.gamemode.enable = true;
  programs.gamescope.enable = true;
}
