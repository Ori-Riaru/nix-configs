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
            numpy
            matplotlib
            # pandas
            # seaborn
          ]);

      texliveWithPkgs = pkgs.texliveMedium.withPackages (ps:
        with ps; [
          tcolorbox
          pdfcol
          enumitem
          upquote
          titling
        ]);
    in {
      devShells.default = pkgs.mkShell {
        packages = [
          pythonWithPkgs
          texliveWithPkgs
          pkgs.pandoc
        ];

        shellHook = ''
          # Point VS Code's Python extension at the flake interpreter.
          mkdir -p .vscode
          ${pythonWithPkgs}/bin/python - <<'PY'
          import json, pathlib
          settings = pathlib.Path(".vscode/settings.json")
          data = {}
          if settings.exists():
              data = json.loads(settings.read_text())
          data["python.defaultInterpreterPath"] = "${pythonWithPkgs}/bin/python"
          settings.write_text(json.dumps(data, indent=2) + "\n")
          PY

          # Register the nix python kernel in the project.
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

          # Mirror it into the user kernelspec dir (~/.local/share/jupyter) so the
          # kernel is discoverable no matter how VS Code was launched.
          ${pythonWithPkgs}/bin/jupyter kernelspec install --user --replace \
            --name nix_python .jupyter/kernels/nix_python 1>/dev/null || true

          export JUPYTER_PATH="$PWD/.jupyter:$JUPYTER_PATH"
        '';
      };
    });
}
