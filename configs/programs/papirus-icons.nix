{pkgs, ...}: {
  home.packages = [
    (pkgs.papirus-icon-theme.override {color = "black";})
  ];

  gtk.iconTheme.name = "Papirus-Dark";
}
