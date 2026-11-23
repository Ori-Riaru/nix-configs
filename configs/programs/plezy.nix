{pkgs, ...}: {
  home.packages = with pkgs; [
    plezy
  ];
}
