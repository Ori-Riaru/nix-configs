{
  description = "Python development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
      };
    in {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          (
            python3.withPackages (python-pkgs:
              with python-pkgs; [
                ruff
                # numpy
                # scipy
                # pandas
                # matplotlib
                # requests
              ])
          )
        ];

        shellHook = ''

        '';
      };
    });
}
