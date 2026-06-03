{
  pkgs,
  config,
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
      name = "${config.theme.fontMonospace}";
      size = 11;
    };
    extraConfig = ''
      background ${config.theme.section}
      foreground ${config.theme.text}
      cursor ${config.theme.accent}
      selection_foreground ${config.theme.text}
      selection_background ${config.theme.overlay}

      color0 ${config.theme.section}
      color8 ${config.theme.overlay}

      color1 ${config.theme.red}
      color9 ${config.theme.red-bright}

      #: green
      color2 ${config.theme.teal}
      color10 ${config.theme.teal-bright}

      #: yellow
      color3 ${config.theme.orange}
      color11 ${config.theme.yellow}

      #: blue
      color4 ${config.theme.blue}
      color12 ${config.theme.blue-bright}

      #: magenta
      color5 ${config.theme.purple}
      color13 ${config.theme.purple-bright}

      #: cyan
      color6 ${config.theme.cyan}
      color14 ${config.theme.cyan-bright}

      #: white
      color7 ${config.theme.subtext}
      color15 ${config.theme.text}
    '';
  };
}
