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

    shellIntegration.enableFishIntegration = true;
    settings = {
      confirm_os_window_close = 0;
    };
    keybindings = {
      "ctrl+c" = "copy_and_clear_or_interrupt";
    };

    font = {
      name = "${settings.fontMonospace}";
      size = 11;
    };
    extraConfig = ''
      background ${settings.section}
      foreground ${settings.text}
      cursor ${settings.accent}
      selection_foreground ${settings.text}
      selection_background ${settings.overlay}

      color0 ${settings.section}
      color8 ${settings.overlay}

      color1 ${settings.red}
      color9 ${settings.red-bright}

      #: green
      color2 ${settings.teal}
      color10 ${settings.teal-bright}

      #: yellow
      color3 ${settings.orange}
      color11 ${settings.yellow}

      #: blue
      color4 ${settings.blue}
      color12 ${settings.blue-bright}

      #: magenta
      color5 ${settings.purple}
      color13 ${settings.purple-bright}

      #: cyan
      color6 ${settings.cyan}
      color14 ${settings.cyan-bright}

      #: white
      color7 ${settings.subtext}
      color15 ${settings.text}
    '';
  };
}
