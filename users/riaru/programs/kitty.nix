{
  pkgs,
  settings,
  ...
}: {
  home.packages = with pkgs; [
    kitty
  ];

  programs.kitty = {
    enable = true;
    font = {
      name = "Jetbrains Mono Nerd Font";
      size = 11;
    };

    settings = {
      confirm_os_window_close = 0;
    };

    shellIntegration.enableFishIntegration = true;

    extraConfig = ''
      background ${settings.base}
      foreground ${settings.text}
      cursor ${settings.accent}
      selection_foreground ${settings.base}
      selection_background ${settings.accent}

      color1 ${settings.red}
      color9 #FF5271

      #: green
      color2  ${settings.teal}
      color10 #9FFFBC

      #: yellow
      color3  ${settings.orange}
      color11 ${settings.yellow}

      #: blue
      color4  ${settings.blue}
      color12 #ACD1FF

      #: magenta
      color5  ${settings.purple}
      color13 #ADA0FF

      #: cyan
      color6  ${settings.cyan}
      color14 #B9F7FF

      #: white
      color7  ${settings.subtext}
      color15 ${settings.text}
    '';
  };
}
