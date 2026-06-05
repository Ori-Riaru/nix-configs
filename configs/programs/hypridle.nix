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
      animations = {
        enabled = true;
        animation = [
          "global, 1, 3, default"
        ];
      };

      background = {
        color = "0xff${lib.substring 1 7 config.theme.section}";
      };

      image = [
        {
          monitor = "";
          path = "/var/lib/AccountsService/icons/${settings.username}";
          size = 240;
          rounding = config.theme.radius;
          border_size = config.theme.border-width;
          border_color = "0xff${lib.substring 1 7 config.theme.purple}";
          position = "0, 240";
          halign = "center";
          valign = "center";
        }
      ];

      shape = [
        # Suspend
        {
          monitor = "";
          size = "96, 96";
          rounding = config.theme.radius;
          border_size = config.theme.border-width;
          border_color = "0xff${lib.substring 1 7 config.theme.overlay}";
          color = "0xff${lib.substring 1 7 config.theme.card}";
          position = "-480, 120";
          halign = "right";
          valign = "bottom";
          onclick = "systemctl suspend";
        }
        # Restart
        {
          monitor = "";
          size = "96, 96";
          rounding = config.theme.radius;
          border_size = config.theme.border-width;
          border_color = "0xff${lib.substring 1 7 config.theme.overlay}";
          color = "0xff${lib.substring 1 7 config.theme.card}";
          position = "-360, 120";
          halign = "right";
          valign = "bottom";
          onclick = "systemctl reboot";
        }
        # Shutdown
        {
          monitor = "";
          size = "96, 96";
          rounding = config.theme.radius;
          border_size = config.theme.border-width;
          border_color = "0xff${lib.substring 1 7 config.theme.overlay}";
          color = "0xff${lib.substring 1 7 config.theme.card}";
          position = "-240, 120";
          halign = "right";
          valign = "bottom";
          onclick = "systemctl poweroff";
        }
        # Logout
        {
          monitor = "";
          size = "96, 96";
          rounding = config.theme.radius;
          border_size = config.theme.border-width;
          border_color = "0xff${lib.substring 1 7 config.theme.overlay}";
          color = "0xff${lib.substring 1 7 config.theme.card}";
          position = "-120, 120";
          halign = "right";
          valign = "bottom";
          onclick = "niri msg action quit";
        }
      ];

      label = [
        # --- Clock ---

        # Hours
        {
          monitor = "";
          text = ''cmd[update:1000] echo "$(date +"%H")"'';
          color = "0xff${lib.substring 1 7 config.theme.text}";
          font_size = 120;
          font_family = config.theme.fontMonospace;
          position = "120, -60";
          halign = "left";
          valign = "top";
        }

        # Minutes
        {
          monitor = "";
          text = ''cmd[update:1000] echo "$(date +"%M")"'';
          color = "0xff${lib.substring 1 7 config.theme.purple}";
          font_size = 120;
          font_family = config.theme.fontMonospace;
          position = "120, -222";
          halign = "left";
          valign = "top";
        }

        # Date
        {
          monitor = "";
          text = ''cmd[update:60000] echo "$(date +"%a, %B %d")"'';
          color = "0xff${lib.substring 1 7 config.theme.subtext}";
          font_size = 24;
          font_family = config.theme.font;
          position = "130, -440";
          halign = "left";
          valign = "top";
        }

        # --- Login ---

        {
          monitor = "";
          text = "$DESC";
          color = "0xff${lib.substring 1 7 config.theme.text}";
          font_size = 48;
          font_family = config.theme.font;
          position = "0, 48";
          halign = "center";
          valign = "center";
        }

        # --- Action buttons ---

        {
          monitor = "";
          text = "󰒲"; # Idk how to fix cut of symbol :(
          color = "0xff${lib.substring 1 7 config.theme.text}";
          font_size = 32;
          font_family = "JetBrainsMono Nerd Font Propo";
          position = "-512, 152";
          halign = "right";
          valign = "bottom";
        }
        {
          monitor = "";
          text = "";
          color = "0xff${lib.substring 1 7 config.theme.text}";
          font_size = 32;
          font_family = "JetBrainsMono Nerd Font Propo";
          position = "-392, 152";
          halign = "right";
          valign = "bottom";
        }
        {
          monitor = "";
          text = "⏻";
          color = "0xff${lib.substring 1 7 config.theme.text}";
          font_size = 32;
          font_family = "JetBrainsMono Nerd Font Propo";
          position = "-272, 152";
          halign = "right";
          valign = "bottom";
        }
        {
          monitor = "";
          text = "󰍃";
          color = "0xff${lib.substring 1 7 config.theme.text}";
          font_size = 32;
          font_family = "JetbrainsMono Nerd Font Mono";
          position = "-156, 156";
          halign = "right";
          valign = "bottom";
        }
      ];

      # --- Password input ---
      input-field = {
        size = "480, 72";
        rounding = config.theme.radius;
        inner_color = "0xff${lib.substring 1 7 config.theme.card}";
        font_color = "0xff${lib.substring 1 7 config.theme.text}";
        fade_on_empty = false;
        fade_timeout = 1000;
        placeholder_text = "$LAYOUT";
        hide_input = false;
        dots_size = 0.25;
        dots_spacing = 0.15;
        check_color = "0xff${lib.substring 1 7 config.theme.purple}";
        fail_color = "0xff${lib.substring 1 7 config.theme.red}";
        fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
        capslock_color = "0xff${lib.substring 1 7 config.theme.orange}";
        outer_color = "0xff${lib.substring 1 7 config.theme.purple}";
        outline_thickness = 2;
        position = "0, -84";
        halign = "center";
        valign = "center";
      };
    };
  };
}
