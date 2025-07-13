{
  pkgs,
  inputs,
  settings,
  ...
}: {
  home.packages = with pkgs; [
    fuzzel
    wofi
    mako
    swww
    libqalculate
  ];

  services.swww.enable = true;

  imports = [
    inputs.niri.homeModules.config
  ];

  programs.niri.settings = {
    # Input device configuration
    input = {
      keyboard = {
        xkb = {
          # You can set rules, model, layout, variant and options.
          # For more information, see xkeyboard-config(7).
          # For example:
          # layout = "us,ru";
          # options = "grp:win_space_toggle,compose:ralt,ctrl:nocaps";
          layout = "us,us";
          variant = ",${settings.keyboard}";
          options = "caps:ctrl_modifier,altwin:swap_alt_win";
        };
        # Note: numlock setting should be handled differently in niri
        # You may need to use a startup command instead
      };
      # Next sections include libinput settings.
      # Omitting settings disables them, or leaves them at their default values.
      touchpad = {
        # off = true;
        tap = true;
        # dwtp = true;
        # dwt = true;
        # drag = false;
        # drag-lock = true;
        natural-scroll = true;
        # accel-speed = 0.2;
        # accel-profile = "flat";
        # scroll-method = "two-finger";
        # disabled-on-external-mouse = true;
      };
      mouse = {
        # off = true;
        # natural-scroll = true;
        # accel-speed = 0.2;
        # accel-profile = "flat";
        # scroll-method = "no-scroll";
      };
      trackpoint = {
        # off = true;
        # natural-scroll = true;
        # accel-speed = 0.2;
        # accel-profile = "flat";
        # scroll-method = "on-button-down";
        # scroll-button = 273;
        # middle-emulation = true;
      };
      # Uncomment this to make the mouse warp to the center of newly focused windows.
      # warp-mouse-to-focus = true;
      # Focus windows and outputs automatically when moving the mouse into them.
      # Setting max-scroll-amount="0%" makes it work only on windows already fully on screen.
      # focus-follows-mouse = {
      #   max-scroll-amount = "0%";
      # };
    };
    # You can configure outputs by their name, which you can find
    # by running `niri msg outputs` while inside a niri instance.
    # The built-in laptop monitor is usually called "eDP-1".
    outputs = {
      # "eDP-1" = {
      #   mode = {
      #     height = 1920;
      #     width = 1080;
      #     refresh = 60.0;
      #   };
      #   scale = 1.25;
      # };

      # "HDMI-A-1" = {
      #   mode = {
      #     height = 1080;
      #     width = 1920;
      #     refresh = 60.0;
      #   };
      #   scale = 1;
      # };

      "Dell Inc. DELL G3223Q C3PM6P3" = {
        mode = {
          height = 2160;
          width = 3840;
          refresh = 143.963;
        };
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
    # Settings that influence how windows are positioned and sized.
    layout = {
      # Set gaps around windows in logical pixels.
      gaps = settings.gap + 2;
      # When to center a column when changing focus
      center-focused-column = "never";
      # You can customize the widths that "switch-preset-column-width" (Mod+R) toggles between.
      preset-column-widths = [
        {proportion = 0.33333;}
        {proportion = 0.5;}
        {proportion = 0.66667;}
        # { fixed = 1920; }
      ];
      # preset-window-heights = [];
      # You can also customize the heights that "switch-preset-window-height" toggles between.
      # You can change the default width of the new windows.
      default-column-width = {proportion = 0.5;};
      # If you leave the brackets empty, the windows themselves will decide their initial width.
      # default-column-width = {};
      # You can change how the focus ring looks.
      focus-ring = {
        # Uncomment this line to disable the focus ring.
        # off = true;
        # How many logical pixels the ring extends out from the windows.
        width = 2;
        # Color of the ring on the active monitor.
        active.color = "${settings.accent}";
        # Color of the ring on inactive monitors.
        # inactive.color = "#505050";
        # You can also use gradients. They take precedence over solid colors.
        # active-gradient = {
        #   from = "#80c8ff"; niri
        #   to = "#bbddff";
        #   angle = 45;
        # };
        # inactive-gradient = {
        #   from = "#505050";
        #   to = "#808080";
        #   angle = 45;
        #   relative-to = "workspace-view";
        # };
      };
      # You can also add a border. It's similar to the focus ring, but always visible.
      border = {
        # The settings are the same as for the focus ring.
        # If you enable the border, you probably want to disable the focus ring.
        enable = false;
        width = 2;
        active.color = "#ffc87f";
        inactive.color = "#505050";
        # Color of the border around windows that request your attention.
        urgent.color = "${settings.red}";
      };
      # You can enable drop shadows for windows.
      shadow = {
        # Uncomment the next line to enable shadows.
        # enable = true;
        # draw-behind-window = true;
        # You can change how shadows look.
        softness = 30;
        spread = 5;
        offset = {
          x = 0;
          y = 5;
        };
        # You can also change the shadow color and opacity.
        color = "#0007";
      };
      # Struts shrink the area occupied by windows, similarly to layer-shell panels.
      struts = {
        # left = 64;
        # right = 64;
        # top = 64;
        # bottom = 64;
      };
    };

    overview = {
      backdrop-color = "#000000";
    };

    spawn-at-startup = [
      {
        command = ["xwayland-satellite"];
      }
      {
        command = ["waybar"];
      }
      {
        command = ["mako"];
      }
      {
        command = ["swww" "daemon"];
      }
      {
        command = ["swww" "img" "${settings.base}"];
      }
      {
        command = ["walker" "--gapplication-service"];
      }
    ];

    # Uncomment this line to ask the clients to omit their client-side decorations if possible.
    prefer-no-csd = true;

    screenshot-path = "~/Captures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

    # Animation settings.
    animations = {
      # Uncomment to turn off all animations.
      # off = true;
      # Slow down all animations by this factor. Values below 1 speed them up instead.
      # slowdown = 3.0;
    };

    # Window rules let you adjust behavior for individual windows.
    window-rules = [
      {
        # Work around WezTerm's initial configure bug
        matches = [
          {app-id = "^org\\.wezfurlong\\.wezterm$";}
        ];
        default-column-width = {};
      }
      {
        # Open the Firefox picture-in-picture player as floating by default.
        matches = [
          {
            app-id = "firefox$";
            title = "^Picture-in-Picture$";
          }
        ];
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
    ];

    binds = {
      # Keys consist of modifiers separated by + signs, followed by an XKB key name
      # Most actions that you can bind here can also be invoked programmatically with
      # `niri msg action do-something`.
      # Mod-Shift-/, which is usually the same as Mod-?,
      # shows a list of important hotkeys.
      "Mod+Shift+Slash".action.show-hotkey-overlay = {};

      "Super+Alt+L" = {
        action.spawn = "swaylock";
        hotkey-overlay.title = "Lock the Screen: swaylock";
      };
      # Example volume keys mappings for PipeWire & WirePlumber.
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

      # "Mod+O" = {
      #   action.toggle-overview = {};
      #   repeat = false;
      # };

      "Mod+K" = {
        action.spawn = ["walker"];
        hotkey-overlay.title = "Toggle Application Launcher: walker";
      };
      "Mod+T" = {
        action.spawn = "kitty";
        hotkey-overlay.title = "Open a Terminal: kitty";
      };
      "Mod+Apostrophe".action.close-window = {};

      # Window focus
      "Mod+Up".action.focus-window-up = {};
      "Mod+Down".action.focus-window-down = {};
      "Mod+Left".action.focus-column-left = {};
      "Mod+Right".action.focus-column-right = {};

      "Mod+O".action.focus-column-left = {};
      "Mod+E".action.focus-column-right = {};

      "Mod+Home".action.focus-column-first = {};
      "Mod+End".action.focus-column-last = {};

      # Window movement
      "Mod+Ctrl+Up".action.move-window-up = {};
      "Mod+Ctrl+Down".action.move-window-down = {};
      "Mod+Ctrl+Left".action.consume-or-expel-window-left = {};
      "Mod+Ctrl+Right".action.consume-or-expel-window-right = {};

      "Mod+Ctrl+O".action.consume-or-expel-window-left = {};
      "Mod+Ctrl+E".action.consume-or-expel-window-right = {};

      "Mod+Ctrl+Home".action.move-column-to-first = {};
      "Mod+Ctrl+End".action.move-column-to-last = {};

      # Workspace Focus
      "Mod+Page_Up".action.focus-workspace-up = {};
      "Mod+Page_Down".action.focus-workspace-down = {};

      "Mod+Comma".action.focus-window-or-workspace-up = {};
      "Mod+Period".action.focus-window-or-workspace-down = {};

      # Workspace Movement
      "Mod+Ctrl+Page_Up".action.move-window-to-workspace-up = {};
      "Mod+Ctrl+Page_Down".action.move-window-to-workspace-down = {};

      "Mod+Ctrl+Comma".action.move-window-up-or-to-workspace-up = {};
      "Mod+Ctrl+Period".action.move-window-down-or-to-workspace-down = {};

      # Monitor focus
      "Mod+Shift+Left".action.focus-monitor-left = {};
      "Mod+Shift+Down".action.focus-monitor-down = {};
      "Mod+Shift+Up".action.focus-monitor-up = {};
      "Mod+Shift+Right".action.focus-monitor-right = {};

      "Mod+Shift+H".action.focus-monitor-left = {};
      "Mod+Shift+J".action.focus-monitor-down = {};
      "Mod+Shift+K".action.focus-monitor-up = {};
      "Mod+Shift+L".action.focus-monitor-right = {};

      # Move column to monitor
      "Mod+Shift+Ctrl+Left".action.move-column-to-monitor-left = {};
      "Mod+Shift+Ctrl+Down".action.move-column-to-monitor-down = {};
      "Mod+Shift+Ctrl+Up".action.move-column-to-monitor-up = {};
      "Mod+Shift+Ctrl+Right".action.move-column-to-monitor-right = {};

      "Mod+Shift+Ctrl+H".action.move-column-to-monitor-left = {};
      "Mod+Shift+Ctrl+J".action.move-column-to-monitor-down = {};
      "Mod+Shift+Ctrl+K".action.move-column-to-monitor-up = {};
      "Mod+Shift+Ctrl+L".action.move-column-to-monitor-right = {};

      # Mouse wheel scrolling
      "Mod+WheelScrollDown" = {
        action.focus-workspace-down = {};
        cooldown-ms = 150;
      };
      "Mod+WheelScrollUp" = {
        action.focus-workspace-up = {};
        cooldown-ms = 150;
      };
      "Mod+Ctrl+WheelScrollDown" = {
        action.move-column-to-workspace-down = {};
        cooldown-ms = 150;
      };
      "Mod+Ctrl+WheelScrollUp" = {
        action.move-column-to-workspace-up = {};
        cooldown-ms = 150;
      };

      "Mod+WheelScrollRight".action.focus-column-right = {};
      "Mod+WheelScrollLeft".action.focus-column-left = {};

      "Mod+Ctrl+WheelScrollRight".action.move-column-right = {};
      "Mod+Ctrl+WheelScrollLeft".action.move-column-left = {};

      "Mod+Shift+WheelScrollDown".action.focus-column-right = {};
      "Mod+Shift+WheelScrollUp".action.focus-column-left = {};
      "Mod+Ctrl+Shift+WheelScrollDown".action.move-column-right = {};
      "Mod+Ctrl+Shift+WheelScrollUp".action.move-column-left = {};

      # Focuse Monitors
      "Mod+1".action.focus-monitor = "Dell Inc. DELL G3223Q C3PM6P3";
      "Mod+2".action.focus-monitor = "Dell Inc. Dell S2417DG #ASMB1cSQQmDd";
      "Mod+3".action.focus-monitor = "Hewlett Packard HP 23cw 6CM5510JRK";
      "Ctrl+Mod+1".action.move-window-to-monitor = "Dell Inc. DELL G3223Q C3PM6P3";
      "Ctrl+Mod+2".action.move-window-to-monitor = "Dell Inc. Dell S2417DG #ASMB1cSQQmDd";
      "Ctrl+Mod+3".action.move-window-to-monitor = "Hewlett Packard HP 23cw 6CM5510JRK";
      
      "Mod+R".action.switch-preset-column-width = {};
      "Mod+Shift+R".action.switch-preset-window-height = {};
      "Mod+Ctrl+R".action.reset-window-height = {};
      "Mod+F".action.maximize-column = {};
      "Mod+Shift+F".action.fullscreen-window = {};
      "Mod+Ctrl+F".action.expand-column-to-available-width = {};
      "Mod+C".action.center-column = {};
      # Removed center-visible-columns as it's not a valid action
      # Use center-column instead or check niri documentation for alternatives
      # Finer width/height adjustments
      "Mod+Minus".action.set-column-width = "-10%";
      "Mod+Equal".action.set-column-width = "+10%";
      "Mod+Shift+Minus".action.set-window-height = "-10%";
      "Mod+Shift+Equal".action.set-window-height = "+10%";

      # Floating windows
      "Mod+V".action.toggle-window-floating = {};
      "Mod+Shift+V".action.switch-focus-between-floating-and-tiling = {};
      # Toggle tabbed column display mode
      "Mod+W".action.toggle-column-tabbed-display = {};

      # Screenshots
      "Print".action.screenshot = {};
      "Ctrl+Print".action.screenshot-screen = {};
      "Alt+Print".action.screenshot-window = {};

      # System controls
      "Mod+Escape" = {
        action.toggle-keyboard-shortcuts-inhibit = {};
        allow-inhibiting = false;
      };
      "Mod+Shift+E".action.quit = {};
      "Ctrl+Alt+Delete".action.quit = {};
      "Mod+Shift+P".action.power-off-monitors = {};

      "Mod+Space".action.switch-layout = "next";
    };

    environment = {
      ELECTRON_OZONE_PLATFORM_HINT = "auto";
      QT_QPA_PLATFORM = "wayland";
      NIXOS_OZONE_WL = "1";
      DISPLAY = ":0";
    };
  };
}
