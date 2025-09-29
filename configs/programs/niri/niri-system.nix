{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # xwayland-satellite
    xdg-utils
  ];

  fonts.enableDefaultPackages = true;

  programs.niri.enable = true;

  xdg = {
    autostart.enable = true;
    menus.enable = true;
    mime.enable = true;
    icons.enable = true;
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
    QT_QPA_PLATFORM = "wayland";
  };
}
