{pkgs, ...}: {
  home.packages = with pkgs; [
    shadps4
  ];
}
