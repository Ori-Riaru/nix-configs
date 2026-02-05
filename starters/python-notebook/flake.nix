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
        config.allowUnfree = true;
      };

      pythonWithPkgs =
        pkgs.python3.withPackages
        (python-pkgs:
          with python-pkgs; [
            ruff
            ipython
            ipykernel
            jupyter
            notebook
            pip
            # numpy
            # pandas
            # matplotlib
            # seaborn
          ]);
    in {
      devShells.default = pkgs.mkShell {
        packages = [
          pythonWithPkgs
        ];

        shellHook = ''
          # Register python kernel
          mkdir -p .jupyter/kernels/nix_python
          cat > .jupyter/kernels/nix_python/kernel.json <<EOF
          {
            "argv": [
              "${pythonWithPkgs}/bin/python",
              "-m",
              "ipykernel_launcher",
              "-f",
              "{connection_file}"
            ],
            "display_name": "Python (Nix)",
            "language": "python",
            "metadata": { "debugger": true }
          }
          EOF

          export JUPYTER_PATH="$PWD/.jupyter:$JUPYTER_PATH"
        '';
      };
    });
}
