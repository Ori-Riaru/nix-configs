{inputs, ...}: {
  additions = final: _prev:
    import ../packages {
      pkgs = final.pkgs;
      inherit inputs;
    };

  modifications = final: prev: {
    hydroxide = prev.hydroxide.overrideAttrs (old: {
      src = final.fetchFromGitHub {
        owner = "Kin69";
        repo = "hydroxide-captcha-fix";
        rev = "ce2340c8bc1042937117b3f45ffac968960903cb";
        hash = "sha256-LN9jEnqhu/fia7KsWo+rb6XPHH8T0iWB3SfpGVyqiZQ=";
      };
    });

    blender = prev.blender.override {
      ceres-solver =
        (prev.ceres-solver.override {
          eigen = final.callPackage ../packages/eigen-blender.nix {};
        }).overrideAttrs (old: {
          # Modern Eigen self-reports as 5.x, which ceres' old
          # "find_package(Eigen3 3.3)" rejects as an incompatible major version.
          postPatch =
            (old.postPatch or "")
            + ''
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
