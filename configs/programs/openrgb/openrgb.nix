{pkgs, ...}: {
  home.packages = with pkgs; [
    openrgb
  ];
}
