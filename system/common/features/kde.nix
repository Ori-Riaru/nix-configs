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
    (callPackage ../../../pkgs/sddm-theme-corners.nix {})

    kde-rounded-corners
    (callPackage ../../../pkgs/kde-geometry-change.nix {})


    #kdePackages.qtstyleplugin-kvantum
    #xdg-desktop-portal-gtk
    #kdePackages.kpackage
  ];
}
