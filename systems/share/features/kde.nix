{pkgs, ...}: {
  services = {
    xserver.enable = true;

    displayManager.sddm = {
      enable = true;
      package = pkgs.lib.mkForce pkgs.libsForQt5.sddm;
      extraPackages = pkgs.lib.mkForce [
        pkgs.libsForQt5.qt5.qtgraphicaleffects
      ];
      theme = "sddm-theme-corners";
    };

    desktopManager.plasma6 = {
      enable = true;
    };
  };

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    kate
  ];

  environment.systemPackages = with pkgs; [
    kde-rounded-corners
    sddm-theme-corners
    kde-geometry-change

    #kdePackages.qtstyleplugin-kvantum
    #xdg-desktop-portal-gtk
    #kdePackages.kpackage
  ];
}
