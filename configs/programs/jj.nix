{pkgs, ...}: {
  home.packages = with pkgs; [
    jj
  ];
}
