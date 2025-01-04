{pkgs, ...}: {
  home.packages = with pkgs; [
    neofetch
    pipes
    tty-clock
    cbonsai
    lavat
    kittysay
  ];
}
