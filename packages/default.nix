
pkgs: {
  simple-kickoff = pkgs.callPackage ./simple-kickoff.nix { };
  sddm-theme-corners = pkgs.callPackage ./sddm-theme-corners.nix { };
  kde-geometry-change = pkgs.callPackage ./kde-geometry-change.nix { };
}
