{pkgs, ...}: {
  home.packages = with pkgs; [
    # UI Fonts
    inter
    inter-nerdfont
    noto-fonts
    roboto
    geist-font

    # Monospace Fonts
    nerd-fonts.jetbrains-mono
    noto-fonts-cjk-sans
    #fira-code-nerdfont
    #cascadia-code
  ];
}
