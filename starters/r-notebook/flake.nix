{
  description = "R development environment";
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
        config.allowUnfree = true;
      };
    in {
      devShells.default = pkgs.mkShell {
        packages = with pkgs;
          [
            R
            radian
            (pkgs.python3.withPackages (python-pkgs:
              with python-pkgs; [
                jupyter
                notebook
              ]))
          ]
          ++ (with rPackages; [
            languageserver
            IRkernel
            # tidyverse
          ]);

        shellHook = ''
          # Register R kernel
          mkdir -p .jupyter/kernels/nix_r
          cat > .jupyter/kernels/nix_r/kernel.json <<EOF
          {
            "argv": [
              "${pkgs.R}/bin/R",
              "--slave",
              "-e",
              "IRkernel::main()",
              "--args",
              "{connection_file}"
            ],
            "display_name": "R (Nix)",
            "language": "R"
          }
          EOF

          export JUPYTER_PATH="$PWD/.jupyter:$JUPYTER_PATH"
        '';
      };
    });
}
