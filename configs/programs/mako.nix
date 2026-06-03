{
  lib,
  config,
  settings,
  ...
}: {
  home.file.".config/mako/notification.mp3" = {source = ../../users/riaru/notification.mp3;};

  services.mako = {
    enable = true;
    settings = {
      default-timeout = 10000;

      background-color = lib.mkForce config.theme.card;
      text-color = lib.mkForce config.theme.text;
      border-size = 2;
      border-radius = lib.mkForce config.theme.radius;
      border-color = lib.mkForce config.theme.accent;

      width = 300;
      height = 1000;
      padding = 10;
      outer-margin = "30,3,3,3";

      max-icon-size = 40;

      max-visible = 10;
      anchor = "bottom-right";

      on-notify = "exec pw-play /home/riaru/.config/mako/notification.mp3";
    };
  };
}
