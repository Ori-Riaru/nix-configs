{pkgs, ...}: {
  home.packages = with pkgs; [
    (pkgs.papirus-icon-theme.override {color = "black";})
  ];
}
