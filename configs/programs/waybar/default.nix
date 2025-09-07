{
  pkgs,
  settings,
  inputs,
  ...
}: {
  programs.waybar = {
    enable = true;
    style = builtins.readFile ./style.css;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 8;
        margin-top = settings.gap;
        margin-left = settings.gap;
        margin-right = settings.gap;
        margin-bottom = 0;
        output = [
          "eDP-1"
          "HDMI-A-1"
          "DP-2"
        ];

        modules-left = ["clock"];
        modules-center = ["niri/workspaces" "cffi/niri-taskbar" "custom/application-launcher"];
        modules-right = ["battery" "pulseaudio" "tray"];

        "clock" = {
          "interval" = 60;
          "align" = 0;
          "rotate" = 0;
          "timezone" = "America/Toronto";
          "tooltip-format" = "<big>{:%B %Y}</big>\n<tt><big>{calendar}</big></tt>";
          "format" = "{:%H:%M}";
          "format-alt" = " {:%a %b %d, %G}";
        };

        "custom/application-launcher" = {
          "format" = " + ";
          "on-click" = "walker";
        };

        "cffi/niri-taskbar" = {
          "module_path" = "${pkgs.niri-taskbar}/lib/libniri_taskbar.so";
          "icon-size" = 10;
        };
      };
    };
  };
}
