# Modern Eigen snapshot matching what upstream Blender builds its
# precompiled dependencies against (pinned in
# build_files/build_environment/cmake/versions.cmake).
#
# Needed because Blender's SLIM ("Minimum Stretch") UV unwrapping silently
# breaks on Eigen 3.4.x (which nixpkgs pins via ceres-solver): every island
# collapses into a circle instead of being refined by the solver.
{
  lib,
  eigen,
  fetchFromGitLab,
}: let
  commit = "8a1083e9bf41b91fdea6546681f806154efdc25a"; # 2025-12-05, picked by upstream
in
  eigen.overrideAttrs (old: {
    version = "unstable-2025-12-05";
    src = fetchFromGitLab {
      owner = "libeigen";
      repo = "eigen";
      rev = commit;
      hash = "sha256-o/ACXW0fr27hw5c15WZmeTqF2Ig8/bNqzS/TXUuEJYc=";
    };
    # Test-only patches for 3.4.x, not applicable on this snapshot.
    patches = [];
  })
