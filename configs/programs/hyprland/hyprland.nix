{
  pkgs,
  settings,
  lib,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      input = {
        kb_layout = "us,us";
        kb_variant = ",${settings.keyboard}";
        kb_options = "";
        repeat_delay = 200;
        repeat_rate = 20;
        touchpad = {
          natural_scroll = true;
        };
        follow_mouse = 1;
      };

      gestures = {
        workspace_swipe_create_new = true;
      };

      general = {
        gaps_in = settings.gap;
        gaps_out = settings.gap + 2;
        border_size = 2;
        "col.active_border" = lib.mkForce "0xff${lib.substring 1 7 settings.accent}";
        "col.inactive_border" = lib.mkForce "0xff505050";
      };

      decoration = {
        rounding = settings.radius;
        blur.enabled = false;
      };

      misc = {
        force_default_wallpaper = 0; # Disable the anime mascot wallpapers
        disable_hyprland_logo = true;
      };

      monitorv2 = [
        {
          output = "DP-2";
          mode = "3840x2160@143.96Hz";
          position = "1152x1080";
          scale = 1.25;
          transform = 0;
        }
        {
          output = "DP-3";
          mode = "2560x1440@144.00Hz";
          position = "0x920";
          scale = 1.25;
          transform = 1; # 90 degrees
        }
        {
          output = "DP-4";
          mode = "1920x1080@60.00Hz";
          position = "1462x0";
          scale = 1;
          transform = 2; # 180 degrees
        }
      ];

      exec-once = [
        "clipse -listen"
        "sh -c 'sleep 2 && swww clear ${settings.base}'"
      ];

      windowrule = [
        "float, title:^(Clipse GUI)$"
        "float, title:^(Picture-in-Picture)$"
        "noborder, class:^(firefox)$, title:^(Picture-in-Picture)$"
      ];

      bind = [
        "SUPER,G,exec,walker"
        "SUPER,V,exec,clipse-gui"
        "SUPER,T,exec,kitty"
        "SUPER,ESCAPE,exit,"
        "SUPER+CTRL,L,exec,hyprlock"
        "SUPER,Q,killactive,"
        "SUPER,F,fullscreen,0"
        "SUPER,W,togglefloating,"
        # Focus
        "SUPER,UP,movefocus,u"
        "SUPER,DOWN,movefocus,d"
        "SUPER,LEFT,movefocus,l"
        "SUPER,RIGHT,movefocus,r"
        # Move windows
        "SUPER+CTRL,UP,movewindow,u"
        "SUPER+CTRL,DOWN,movewindow,d"
        "SUPER+CTRL,LEFT,movewindow,l"
        "SUPER+CTRL,RIGHT,movewindow,r"
      ];

      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl s 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl s 5%-"
      ];
    };
  };
}
