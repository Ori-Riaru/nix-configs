{pkgs, ...}: {
  # launch with sudo -E gparted because of wayland bug or something
  home.packages = with pkgs; [
    gparted
  ];
}
