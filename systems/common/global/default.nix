{
  inputs,
  outputs,
  pkgs,
  ...
}: {
  imports = [
    ./ssh.nix
    ./nix.nix
    ./locale.nix
    ./fish.nix
    ./input.nix
    ./networking.nix
  ];

  environment.systemPackages = with pkgs; [
    git
    gh
  ];

  nixpkgs = {
    overlays = [
      inputs.nur.overlays.default
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages
    ];

    config = {
      allowUnfree = true;
    };
  };
}
