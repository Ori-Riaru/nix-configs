{
  imports = [
    ../system/ssh.nix
    ../system/nix-system.nix
    ../system/locale.nix
    ../system/input.nix
    ../system/networking.nix
    ../system/swap.nix
    ../system/fonts-system.nix
    ../system/xdg.nix
    ../system/home-manager.nix
    ../../modules/theme-settings.nix
    # ../system/uutils.nix # Broken because of https://github.com/uutils/coreutils/pull/11346
  ];
}
