{pkgs, ...}: {
  home.packages = with pkgs; [
    unrar
  ];
}
