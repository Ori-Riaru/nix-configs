{pkgs, ...}: {
  environment.systemPackages = with pkgs; [xdg-utils];
  xdg = {
    autostart.enable = true;
    menus.enable = true;
    icons.enable = true;
  };
}
