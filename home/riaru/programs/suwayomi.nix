{pkgs, ...}: {
  home.packages = with pkgs; [
    suwayomi-server
  ];
}
