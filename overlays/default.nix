{ inputs, ... }:
{
  additions = final: _prev: import ../packages {
      pkgs = final.pkgs;
      inherit inputs;
    };

  modifications = final: prev: {
    # example = prev.example.overrideAttrs (oldAttrs: rec {
    # ...
    # });

    # Blender's SLIM "Minimum Stretch" UV unwrapping breaks against Eigen 3.4.x
    # (which nixpkgs pins via ceres-solver): every island collapses into a circle.
    # Upstream builds its dependencies against a modern Eigen snapshot, so
    # rebuild ceres (blender's only eigen provider) against that and feed it to blender.
    blender = prev.blender.override {
      ceres-solver = (prev.ceres-solver.override {
        eigen = final.callPackage ../packages/eigen-blender.nix {};
      }).overrideAttrs (old: {
        # Modern Eigen self-reports as 5.x, which ceres' old
        # "find_package(Eigen3 3.3)" rejects as an incompatible major version.
        postPatch = (old.postPatch or "") + ''
          substituteInPlace CMakeLists.txt --replace-fail \
            'find_package(Eigen3 3.3 REQUIRED)' 'find_package(Eigen3 REQUIRED)'
        '';
      });
    };
  };

  stable-packages = final: _prev: {
    stable = import inputs.nixpkgs-stable {
      system = final.stdenv.hostPlatform.system;
      config.allowUnfree = true;
    };
  };

  master-packages = final: _prev: {
    master = import inputs.nixpkgs-master {
      system = final.stdenv.hostPlatform.system;
      config.allowUnfree = true;
    };
  };
}
