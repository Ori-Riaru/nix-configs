{pkgs, ...}: {
  home.packages = with pkgs; [
    jellyfin-media-player
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "qtwebengine-5.15.19"
  ];
}
