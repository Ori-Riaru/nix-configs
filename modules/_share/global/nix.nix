{
  pkgs,
  lib,
  inputs,
  config,
  settings,
  ...
}: {
  environment.systemPackages = with pkgs; [
    nh
    nix-output-monitor
    alejandra
    nvd
  ];

  environment.variables = {
    NH_FLAKE = "/mnt/nfs/${settings.username}/Projects/nix-configs";
  };

  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      trusted-users = ["root" "riaru"];
      experimental-features = "nix-command flakes";
      flake-registry = "";

      nix-path = config.nix.nixPath;

      auto-optimise-store = true;
    };

    channel.enable = false;

    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 1w";
    };
  };
}
