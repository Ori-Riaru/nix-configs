{pkgs, ...}: {
  home.packages = with pkgs; [
    # UI Fonts
    inter

    # Monospace Fonts
    nerd-fonts.jetbrains-mono
    #fira-code-nerdfont
    #cascadia-code
  ];
}
