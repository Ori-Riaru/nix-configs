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
    # BROKEN: kde-rounded-corners
    kde-geometry-change
    # kdePackages.qtstyleplugin-kvantum
  ];
}
