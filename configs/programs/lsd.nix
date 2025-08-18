{pkgs, ...}: {
  home.packages = with pkgs; [
    lsd
  ];
}
