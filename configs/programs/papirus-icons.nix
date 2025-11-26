{pkgs, ...}: {
  home.packages = with pkgs.stable; [
    (pkgs.papirus-icon-theme.override {color = "black";})
  ];
}
