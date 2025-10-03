{...}: {
  imports = [
    ../../../configs/system/home-global
    ../../../configs/system/folders.nix

    ../../../configs/groups/niri-desktop.nix

    # CLI
    ../../../configs/groups/cli-base.nix
    ../../../configs/programs/btop.nix

    # Tools
    ../../../configs/programs/firefox/firefox.nix
    ../../../configs/programs/chromium.nix
    ../../../configs/programs/kitty.nix

    # Development
    ../../../configs/programs/nix.nix
    ../../../configs/programs/git.nix
    ../../../configs/programs/vscodium/vscodium.nix

    # System
    ../../../configs/programs/file-viewers.nix
    ../../../configs/programs/fonts.nix
  ];

  home.stateVersion = "24.05";
}
