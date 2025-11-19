{
  pkgs,
  settings,
  lib,
  ...
}: {
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "brightnessctl -r";
      };

      listener = [
        {
          timeout = 1485;
          on-timeout = "brightnessctl -s set 2.5%";
          on-resume = "brightnessctl -r";
        }
        {
          timeout = 1500;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };

  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
      };

      animations = {
        animation = [
          "fade, 0"
        ];
      };

      background = {
        color = "0xff${lib.substring 1 7 settings.base}";
      };

      input-field = {
        rounding = settings.radius;
        outer_color = "0xff${lib.substring 1 7 settings.section}";
        inner_color = "0xff${lib.substring 1 7 settings.section}";
        font_color = "0xff${lib.substring 1 7 settings.text}";
        fail_color = "0xff${lib.substring 1 7 settings.red}";
        check_color = "0xff${lib.substring 1 7 settings.blue}";
      };
    };
  };
}
