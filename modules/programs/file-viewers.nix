{pkgs, ...}: {
  home.packages = with pkgs; [
    unrar

    # Image Viewer
    loupe

    # Video Player
    kdePackages.dragon

    # Audio Player
    amberol
  ];
}
