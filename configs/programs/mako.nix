{
  lib,
  settings,
  ...
}: {
  services.mako = {
    enable = true;
    settings = {
      default-timeout = 2000;

      background-color = lib.mkForce settings.card;
      text-color = lib.mkForce settings.text;
      border-size = 2;
      border-radius = lib.mkForce settings.radius;
      border-color = lib.mkForce settings.accent;

      width = 300;
      height = 60;
      padding = 20;

      max-icon-size = 40;

      max-visible = 5;
      anchor = "top-left";
    };
  };
}
