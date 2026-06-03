{
  pkgs,
  lib,
  inputs,
  config,
  settings,
  outputs,
  ...
}: {
  imports = [
    inputs.nix-index-database.nixosModules.default
  ];

  environment.systemPackages = with pkgs; [
    nh
    nix-output-monitor
    nvd
    statix
    alejandra
    nixfmt
    nurl
  ];

  programs.nix-index-database.comma.enable = true;

  environment = {
    variables = {
      NH_FLAKE = "${settings.configPath}";
    };

    sessionVariables = {
      NH_FLAKE = "${settings.configPath}";
    };
  };

  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    package = pkgs.lixPackageSets.stable.lix;
    settings = {
      trusted-users = ["root" "${settings.username}"];
      experimental-features = "nix-command flakes pipe-operator";
      flake-registry = "";
      nix-path = config.nix.nixPath;
      auto-optimise-store = true;
    };

    channel.enable = false;

    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;

    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 14d";
    };
  };

  nixpkgs = {
    overlays = [
      inputs.nur.overlays.default
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages
      outputs.overlays.master-packages
      (import ../../configs/programs/vscodium/overlay.nix)
    ];

    config = {
      allowUnfree = true;
      allowBroken = true;
      permittedInsecurePackages = [
        "electron-38.8.4"
      ];
    };
  };
}
