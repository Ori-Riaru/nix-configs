{pkgs, ...}: {
  home.packages = with pkgs; [
    cura-appimage
  ];
}
