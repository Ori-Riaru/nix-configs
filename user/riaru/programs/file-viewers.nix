{pkgs, ...}: {
  home.packages = with pkgs; [
    unrar

    # Image Viewer
    loupe

    # Video Player
    dragon

    # Audio Player
    amberol

    # Other
    gnome-boxes
  ];
}
