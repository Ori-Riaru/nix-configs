{
  pkgs,
  config,
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
        color = "0xff${lib.substring 1 7 config.userSettings.base}";
      };

      # Date label
      label = [
        {
          monitor = "";
          text = ''cmd[update:1000] echo "$(date +"%A, %B %d")"'';
          color = "0xff${lib.substring 1 7 config.userSettings.subtext}";
          font_size = 22;
          font_family = config.userSettings.font;
          position = "0, 350";
          halign = "center";
          valign = "center";
        }

        # Time label
        {
          monitor = "";
          text = ''cmd[update:1000] echo "$(date +"%H:%M")"'';
          color = "0xff${lib.substring 1 7 config.userSettings.text}";
          font_size = 120;
          font_family = config.userSettings.font;
          position = "0, 200";
          halign = "center";
          valign = "center";
        }
      ];

      # Password input field
      input-field = {
        rounding = config.userSettings.radius;
        inner_color = "0xff${lib.substring 1 7 config.userSettings.section}";
        font_color = "0xff${lib.substring 1 7 config.userSettings.text}";
        fade_on_empty = false;
        fade_timeout = 1000;
        placeholder_text = "$LAYOUT";
        hide_input = false;
        check_color = "0xff${lib.substring 1 7 config.userSettings.blue}";
        fail_color = "0xff${lib.substring 1 7 config.userSettings.red}";
        fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
        capslock_color = "0xff${lib.substring 1 7 config.userSettings.orange}";
        position = "0, -140";
        halign = "center";
        valign = "center";
      };
    };
  };
}
