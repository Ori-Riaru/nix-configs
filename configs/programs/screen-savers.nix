{pkgs, ...}: {
  home.packages = with pkgs; [
    fastfetch
    pipes
    tty-clock
    cbonsai
    lavat
    kittysay
    colorpanes
  ];
}
