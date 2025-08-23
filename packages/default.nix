pkgs: {
  simple-kickoff = pkgs.callPackage ./simple-kickoff.nix {};
  sddm-theme-corners = pkgs.callPackage ./sddm-theme-corners.nix {};
  kde-geometry-change = pkgs.callPackage ./kde-geometry-change.nix {};
  clipse-gui = pkgs.callPackage ./clipse-gui.nix {};
  nautilus-hide = pkgs.callPackage ./nautilus-hide.nix {};
  hello = pkgs.callPackage ./hello.nix {};
  icat = pkgs.callPackage ./icat.nix {};
  hello-script = pkgs.callPackage ./hello-script.nix {audiance = "People";};
}
