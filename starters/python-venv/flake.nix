{
  description = "Python virtual environment (venv)";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = {
    self,
    nixpkgs,
  }: let
    inherit (nixpkgs) lib;

    supportedSystems = [
      "x86_64-linux"
      "aarch64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];

    forEachSupportedSystem = f:
      lib.genAttrs supportedSystems (system:
        f {
          inherit system;
          pkgs = import nixpkgs {inherit system;};
        });
  in {
    devShells = forEachSupportedSystem ({
      pkgs,
      system,
    }: let
      python = pkgs.python313;
    in {
      default = pkgs.mkShell {
        venvDir = ".venv";

        packages =
          (with python.pkgs; [
            venvShellHook
            pip
            ruff
          ])
          ++ [self.formatter.${system}];

        postShellHook = ''
          export LD_LIBRARY_PATH="${lib.makeLibraryPath [
            pkgs.stdenv.cc.cc.lib
            pkgs.gfortran.cc.lib
            pkgs.zlib
            pkgs.zstd
            pkgs.lz4
            pkgs.bzip2
            pkgs.xz
            pkgs.libffi
            pkgs.libglvnd
          ]}''${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"

          # Warn when the venv was built for a different Python version, and
          # stop referencing a Nix interpreter that was garbage collected.
          venvPython="$venvDir/bin/python"
          if [ -L "$venvPython" ] && [ ! -e "$venvPython" ]; then
            cat <<EOF
          Warning: the venv points at a Python that was garbage collected.
                   Run: rm -rf .venv && reload, to rebuild it
          EOF
          elif [ -x "$venvPython" ]; then
            venvVersion="$("$venvPython" -c 'import platform; print(platform.python_version())')"
            if [[ "$venvVersion" != "${python.version}" ]]; then
              cat <<EOF
          Warning: Python version mismatch: [$venvVersion (venv)] != [${python.version}]
                   Run: rm -rf .venv && reload, to rebuild for ${python.version}
          EOF
            fi
          fi
        '';
      };
    });

    formatter = forEachSupportedSystem ({pkgs, ...}: pkgs.alejandra);
  };
}
