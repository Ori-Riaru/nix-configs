{...}: {
  imports = [
    ../../../configs/system/home-global
    
    ../../../configs/programs/fish.nix
    ../../../configs/programs/starship.nix
    ../../../configs/programs/zoxide.nix
    ../../../configs/programs/git.nix
    ../../../configs/programs/cli-tools.nix
    ../../../configs/programs/screen-savers.nix

    ../../../configs/system/folders.nix
  ];

  home.stateVersion = "24.05";
}
