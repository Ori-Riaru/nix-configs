{
  imports = [
    ../../../configs/system/home-global
    ../../../configs/programs/sops-home.nix
    ../../../configs/groups/cli-base.nix
    ../../../configs/programs/speedtest-cli.nix
    ../../../configs/programs/screen-savers.nix
    ../../../configs/programs/btop.nix
    ../../../configs/programs/git.nix
    ../../../configs/system/folders.nix
  ];

  home.stateVersion = "24.05";
}
