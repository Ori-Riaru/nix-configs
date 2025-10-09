{pkgs, ...}: {
  home.packages = with pkgs.stable; [
    meshlab
  ];
}
