{
  lib,
  settings,
  ...
}: {
  services.mako = {
    enable = true;
    settings = {
      default-timeout = 2000;
      background-color = lib.mkForce "${settings.base}FF";
      text-color = lib.mkForce settings.text;
      width = 300;
      height = 60;
      margin = 20;
      padding = 20;
      border-size = 10;
      corner-radius = settings.radius;
      icon-size = 40;
      max-visible = 5;
      position = "top-right";
      monitor = "eDP-1";
    };
  };
}
