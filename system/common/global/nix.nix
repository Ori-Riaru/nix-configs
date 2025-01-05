{
  pkgs,
  lib,
  inputs,
  config,
  ...
}: {
  environment.systemPackages = with pkgs; [
    nh
    nix-output-monitor
    alejandra
    nvd
  ];

  environment.sessionVariables = {
    FLAKEREF = "~/Projects/nix-configs";
  };

  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      experimental-features = "nix-command flakes";
      flake-registry = "";

      nix-path = config.nix.nixPath;
    };

    channel.enable = false;

    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
}
