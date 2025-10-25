{pkgs, ...}: {
  home.packages = with pkgs; [
    grex
  ];
}
