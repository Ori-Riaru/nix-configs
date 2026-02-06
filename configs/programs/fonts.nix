{pkgs, ...}: {
  home.packages = with pkgs; [
    # UI Fonts
    inter

    # Monospace Fonts
    nerd-fonts.jetbrains-mono
    noto-fonts-cjk-sans
    #fira-code-nerdfont
    #cascadia-code
  ];

  fonts.fontconfig.enable = true;
}
