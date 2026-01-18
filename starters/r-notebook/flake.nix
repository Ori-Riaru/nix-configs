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
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShells.default = pkgs.mkShell {
          packages = with pkgs;
            [
              R
              radian
              (python3.withPackages (ps: [
                ps.jupyter
                ps.notebook
              ]))
            ]
            ++ (with rPackages; [
              languageserver
              IRkernel
            ]);
          shellHook = ''
            mkdir -p .jupyter/kernels/ir
            cp -r ${pkgs.rPackages.IRkernel}/library/IRkernel/kernelspec/* .jupyter/kernels/ir/
            chmod -R u+w .jupyter/kernels/ir
            export JUPYTER_PATH="$PWD/.jupyter"
          '';
        };
      }
    );
}
