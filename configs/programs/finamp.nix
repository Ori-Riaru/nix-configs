{pkgs, ...}: {
  home.packages = with pkgs; [
    finamp
  ];
}
