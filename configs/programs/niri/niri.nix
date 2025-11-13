{
  pkgs,
  inputs,
  settings,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    xwayland-satellite
    swww
    brightnessctl
  ];

  imports = [
    inputs.niri.homeModules.config
  ];

  programs.niri.settings = {
    input = {
      keyboard = {
        xkb = {
          layout = "us,us";
          variant = ",${settings.keyboard}";
          options = "";
        };
        repeat-delay = 200;
        repeat-rate = 20;
      };

      touchpad = {
        tap = true;
        natural-scroll = true;
      };
      focus-follows-mouse.enable = true;
      focus-follows-mouse.max-scroll-amount = "50%";
    };

    outputs = {
      "eDP-1" = {
        mode = {
          height = 1920;
          width = 1080;
          refresh = 60.0;
        };
        scale = 1.25;
      };

      "HDMI-A-1" = {
        mode = {
          width = 1920;
          height = 1080;
          refresh = 60.0;
        };
        scale = 1;
        position = {
          x = 1920;
          y = 0;
        };
      };

      "Dell Inc. DELL G3223Q C3PM6P3" = {
        mode = {
          height = 2160;
          width = 3840;
          refresh = 143.963;
        };
        variable-refresh-rate = false;
        scale = 1.25;
        position = {
          x = 1152;
          y = 1080;
        };
      };

      "Dell Inc. Dell S2417DG #ASMB1cSQQmDd" = {
        mode = {
          height = 1440;
          width = 2560;
          refresh = 143.998;
        };
        variable-refresh-rate = false;
        transform.rotation = 90;
        scale = 1.25;
        position = {
          x = 0;
          y = 920;
        };
      };

      "Hewlett Packard HP 23cw 6CM5510JRK" = {
        mode = {
          height = 1080;
          width = 1920;
          refresh = 60.0;
        };
        transform.rotation = 180;
        scale = 1;
        position = {
          x = 1462;
          y = 0;
        };
      };
    };

    layout = {
      gaps = settings.gap + 2;
      center-focused-column = "never";
      preset-column-widths = [
        {proportion = 0.1666666667;}
        {proportion = 0.3333333334;}
        {proportion = 0.5;}
        {proportion = 0.6666666667;}
        {proportion = 0.8333333334;}
        {proportion = 1.0;}
      ];
      default-column-width = {proportion = 0.5;};

      focus-ring = {
        width = 2;
        active.color = "${settings.accent}";
      };

      background-color = "transparent";

      border = {
        enable = false;
        width = 2;
        active.color = "#ffc87f";
        inactive.color = "#505050";
        urgent.color = "${settings.red}";
      };

      shadow = {
        softness = 30;
        spread = 5;
        offset = {
          x = 0;
          y = 5;
        };
        color = "#0007";
      };
    };

    overview.backdrop-color = "#000000";

    spawn-at-startup = [
      {command = ["clipse" "-listen"];}
      {command = ["sh" "-c" "sleep 4 && swww-daemon"];}
      {command = ["sh" "-c" "sleep 5 && swww clear ${settings.base}"];}
      {command = ["sh" "-c" "sleep 6 && swww img ${settings.wallpaper} -o DP-2"];}
      {command = ["sh" "-c" "sleep 5 && openrgb --profile off"];}
    ];

    prefer-no-csd = true;
    screenshot-path = "~/Captures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

    window-rules = [
      {
        matches = [{app-id = "^org\\.wezfurlong\\.wezterm$";}];
        default-column-width = {};
      }
      {
        matches = [
          {
            app-id = "firefox$";
            title = "^Picture-in-Picture$";
          }
        ];
        open-floating = true;
      }
      {
        matches = [{title = "Clipse GUI";}];
        open-floating = true;
      }
      {
        matches = [];
        geometry-corner-radius = {
          top-left = settings.radius + 0.0;
          top-right = settings.radius + 0.0;
          bottom-left = settings.radius + 0.0;
          bottom-right = settings.radius + 0.0;
        };
        clip-to-geometry = true;
      }
      {
        matches = [{app-id = "org.gnome.Nautilus";}];
        default-column-width = {proportion = 0.1666666667;};
      }
    ];

    hotkey-overlay.skip-at-startup = true;

    binds = {
      "Mod+H".action.show-hotkey-overlay = {};

      # System controls
      "Mod+Ctrl+L" = {
        action.spawn = "hyprlock";
        hotkey-overlay.title = "Lock the Screen";
      };
      "Mod+escape".action.quit = {};

      # Volume controls
      "XF86AudioRaiseVolume" = {
        action.spawn = ["wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.05+"];
        allow-when-locked = true;
      };
      "XF86AudioLowerVolume" = {
        action.spawn = ["wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.05-"];
        allow-when-locked = true;
      };
      "XF86AudioMute" = {
        action.spawn = ["wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"];
        allow-when-locked = true;
      };
      "XF86AudioMicMute" = {
        action.spawn = ["wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle"];
        allow-when-locked = true;
      };

      # Brightness controls
      "XF86MonBrightnessUp" = {
        action.spawn = ["brightnessctl" "set" "5%+"];
        allow-when-locked = true;
      };
      "XF86MonBrightnessDown" = {
        action.spawn = ["brightnessctl" "set" "5%-"];
        allow-when-locked = true;
      };

      # Applications
      "Mod+G".action.spawn = ["walker"];
      "Mod+V".action.spawn = ["walker" "--provider" "clipboard"];
      "Mod+T".action.spawn = ["ghostty"];

      # Window Management
      "Mod+Q".action.close-window = {};
      "Mod+R".action.switch-preset-column-width = {};
      "Ctrl+Mod+R".action.switch-preset-column-width-back = {};
      "Shift+Mod+R".action.expand-column-to-available-width = {};

      "Mod+F".action.maximize-column = {};
      "Mod+Shift+F".action.fullscreen-window = {};
      "Mod+C".action.center-column = {};
      "Mod+O" = {
        action.toggle-overview = {};
        repeat = false;
      };
      "Mod+W".action.toggle-window-floating = {};
      "Mod+L".action.toggle-column-tabbed-display = {};

      # Window Focus
      "Mod+Up".action.focus-window-or-workspace-up = {};
      "Mod+Down".action.focus-window-or-workspace-down = {};
      "Mod+Left".action.focus-column-left = {};
      "Mod+Right".action.focus-column-right = {};
      "Mod+Shift+W".action.switch-focus-between-floating-and-tiling = {};

      # Window Movement
      "Mod+Ctrl+Up".action.move-window-up-or-to-workspace-up = {};
      "Mod+Ctrl+Down".action.move-window-down-or-to-workspace-down = {};
      "Mod+Ctrl+Left".action.consume-or-expel-window-left = {};
      "Mod+Ctrl+Right".action.consume-or-expel-window-right = {};

      # Monitor Management
      "Mod+M" = {
        action.spawn = [
          "sh"
          "-c"
          "niri-msg output Dell Inc. Dell S2417DG #ASMB1cSQQmDd toggle && niri-msg output Hewlett Packard HP 23cw 6CM5510JRK toggle"
        ];
      };

      # Monitor Focus
      "Mod+D".action.focus-monitor-next = {};
      "Mod+1".action.focus-monitor = "Dell Inc. DELL G3223Q C3PM6P3";
      "Mod+2".action.focus-monitor = "Dell Inc. Dell S2417DG #ASMB1cSQQmDd";
      "Mod+3".action.focus-monitor = "Hewlett Packard HP 23cw 6CM5510JRK";
      "Ctrl+Mod+D".action.move-window-to-monitor-next = {};
      "Ctrl+Mod+1".action.move-window-to-monitor = "Dell Inc. DELL G3223Q C3PM6P3";
      "Ctrl+Mod+2".action.move-window-to-monitor = "Dell Inc. Dell S2417DG #ASMB1cSQQmDd";
      "Ctrl+Mod+3".action.move-window-to-monitor = "Hewlett Packard HP 23cw 6CM5510JRK";

      # Screenshots
      "Mod+P".action.screenshot = {};
      "Ctrl+Print".action.screenshot-screen = {};
      "Alt+Print".action.screenshot-window = {};
    };
  };
}
