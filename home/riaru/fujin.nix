{...}: {
  imports = [
    ./global

    ./programs/cli-tools.nix
    ./programs/git.nix
    ./programs/fish.nix
    ./programs/starship.nix
    ./programs/zoxide.nix
    ./programs/nix.nix
    ./programs/screen-savers.nix
  ];

  home.stateVersion = "24.05";
}
