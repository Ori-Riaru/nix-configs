{pkgs, ...}: {
  home.packages = with pkgs; [
    fspy
  ];
}
