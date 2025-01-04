{pkgs, ...}: {
  home.packages = with pkgs; [
    kdiskmark
  ];
}
