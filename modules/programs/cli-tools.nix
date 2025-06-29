{pkgs, ...}: {
  home.packages = with pkgs; [
    bat
    fzf
    tldr
    lsd
    btop
    speedtest-cli
    lf
    xclip
    trash-cli
  ];
}
