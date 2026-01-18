{
  description = "Advanced Computer Graphics OpenGL Development Environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    freeimage.url = "github:nixos/nixpkgs/nixos-25.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    freeimage,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {inherit system;};
        pkgs-freeimage = import freeimage {
          inherit system;
          config = {
            permittedInsecurePackages = [
              "freeimage-3.18.0-unstable-2024-04-18"
            ];
          };
        };
      in {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            glfw
            glew
            glm
            tinyobjloader
            glsl_analyzer
            pkgs-freeimage.freeimage
          ];

          shellHook = '''';
        };
      }
    );
}
