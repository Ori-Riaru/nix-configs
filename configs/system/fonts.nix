{pkgs, ...}: {
  home.packages = with pkgs; [
    # UI Fonts
    inter
    inter-nerdfont

    # Monospace Fonts
    nerd-fonts.jetbrains-mono
    noto-fonts-cjk-sans
    #fira-code-nerdfont
    #cascadia-code
  ];
}
