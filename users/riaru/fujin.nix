{...}: {
  imports = [
    ./global

    ../../modules/programs/cli-tools.nix
    ../../modules/programs/git.nix
    ../../modules/programs/fish.nix
    ../../modules/programs/starship.nix
    ../../modules/programs/zoxide.nix
    ../../modules/programs/nix.nix
    ../../modules/programs/screen-savers.nix
  ];

  home.stateVersion = "24.05";
}
