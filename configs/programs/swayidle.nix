{
  pkgs,
  settings,
  lib,
  ...
}: {
  services.swayidle = {
    enable = true;
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.hyprlock}/bin/hyprlock";
      }
      {
        event = "lock";
        command = ''${pkgs.procps}/bin/pidof hyprlock || ${pkgs.hyprlock}/bin/hyprlock'';
      }
    ];
    timeouts = [
      {
        timeout = 1500; # 25 minutes - dim screen
        command = "${pkgs.brightnessctl}/bin/brightnessctl -s set 5%";
        resumeCommand = "${pkgs.brightnessctl}/bin/brightnessctl -r";
      }
      {
        timeout = 1680; # 28 minutes - lock session
        command = ''${pkgs.procps}/bin/pidof hyprlock || ${pkgs.hyprlock}/bin/hyprlock'';
      }
      {
        timeout = 1800; # 30 minutes - turn off monitors
        command = "${pkgs.niri}/bin/niri msg action power-off-monitors";
        resumeCommand = "${pkgs.niri}/bin/niri msg action power-on-monitors";
      }
      {
        timeout = 2100; # 35 minutes - suspend
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
  };

  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
        no_fade_in = true;
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
