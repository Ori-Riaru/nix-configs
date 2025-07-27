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
    ./input.nix
    ./networking.nix
    ./swap.nix
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
