{pkgs, ...}: {
  home.packages = with pkgs; [
    loupe
    showtime
    amberol
  ];
}
