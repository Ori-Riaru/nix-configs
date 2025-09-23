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
}
