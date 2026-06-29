{
  imports = [
    ../../../modules/user-settings.nix
    ../../../configs/system/home-global

    ../../../configs/programs/sops-home.nix

    # System
    ../../../configs/system/folders.nix

    # Terminal & CLI
    ../../../configs/groups/cli-apps.nix
    ../../../configs/programs/ghostty.nix
    ../../../configs/programs/btop.nix
    ../../../configs/programs/speedtest-cli.nix

    # Development
    ../../../configs/programs/git.nix
    ../../../configs/programs/opencode/opencode.nix
    ../../../configs/programs/nix.nix
  ];

  home.stateVersion = "26.05";
}
