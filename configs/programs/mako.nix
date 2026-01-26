{
  lib,
  settings,
  ...
}: {
  home.file.".config/mako/notification.mp3" = {source = ../../users/riaru/notification.mp3;};

  services.mako = {
    enable = true;
    settings = {
      default-timeout = 10000;

      background-color = lib.mkForce settings.card;
      text-color = lib.mkForce settings.text;
      border-size = 2;
      border-radius = lib.mkForce settings.radius;
      border-color = lib.mkForce settings.accent;

      width = 300;
      height = 1000;
      padding = 10;

      max-icon-size = 40;

      max-visible = 5;
      anchor = "top-left";

      on-notify = "exec pw-play /home/riaru/.config/mako/notification.mp3";
    };
  };
}
