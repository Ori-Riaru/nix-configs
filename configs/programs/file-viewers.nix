{pkgs, ...}: {
  home.packages = with pkgs; [
    # Image Viewer
    loupe

    # Video Player
    kdePackages.dragon

    # Audio Player
    amberol
  ];
}
