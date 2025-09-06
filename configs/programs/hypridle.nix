{pkgs, ...}: {
  home.packages = with pkgs; [
    brightnessctl
  ];

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        after_sleep_cmd = "niri msg action power-on-monitors";
        ignore_dbus_inhibit = false;
        lock_cmd = "hyprlock";
      };

      listener = [
        {
          timeout = 1500; # 25 minutes - lock session
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 1680; # 28 minutes - dim screen
          on-timeout = "brightnessctl -s set 5%";
          on-resume = "brightnessctl -r";
        }
        {
          timeout = 1800; # 30 minutes - turn off monitors
          on-timeout = "niri msg action power-off-monitors";
          on-resume = "niri msg action power-on-monitors";
        }
        {
          timeout = 2100; # 35 minutes - suspend
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
    };
  };
}
