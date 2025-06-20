{...}: {
  imports = [
    ../../modules/_share/home-global

    ../../modules/programs/nix.nix
    ../../modules/programs/fish.nix
    ../../modules/programs/starship.nix
    ../../modules/programs/zoxide.nix
    ../../modules/programs/git.nix
    ../../modules/programs/cli-tools.nix
    ../../modules/programs/screen-savers.nix

    ../../modules/_share/folders.nix
  ];

  home.stateVersion = "24.05";
}
