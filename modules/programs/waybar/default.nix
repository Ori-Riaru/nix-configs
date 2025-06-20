{
  pkgs,
  settings,
  ...
}: {


  programs.waybar = {
    enable = true;
    # style = builtins.readFile ./style.css;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 8;
        output = [
          "eDP-1"
        ];
        modules-left = ["clock" "niri/workspaces"];
        # modules-center = ["wlr/taskbar"];
        modules-right = ["niri/language" "upower"];
      };
    };
  };
}
