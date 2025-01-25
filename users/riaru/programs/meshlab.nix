{pkgs, ...}: {
  home.packages = with pkgs; [
    meshlab
  ];
}
