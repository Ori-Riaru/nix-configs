{pkgs, ...}: {
  services.xserver = {
    enable = true;
  };

  services.desktopManager.plasma6 = {
    enable = true;
  };

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    kate
  ];

  environment.systemPackages = with pkgs; [
    # kde-rounded-corners
    kde-geometry-change

    # kdePackages.qtstyleplugin-kvantum
    # sddm-theme-corners
    # xdg-desktop-portal-gtk
    # kdePackages.kpackage
  ];
}
