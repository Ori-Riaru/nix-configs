{pkgs, ...}: {
  home.packages = with pkgs.stable; [
    shotcut
  ];
}
