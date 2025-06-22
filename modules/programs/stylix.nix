{settings, inputs, ...}: {
  imports = [
    inputs.stylix.homeModules.stylix
  ];

  stylix = {
    enable = true;

    fonts = {
      monospace = {
        name = "JetBrainsMono Nerd Font";
      };

      sansSerif = {
        name = "Inter";
      };
    };

    polarity = "dark";
    base16Scheme = {
      base00 = "#000000";
      base01 = "#1c1c1c";
      base02 = "#262626";
      base03 = "#303030";
      base04 = "#3a3a3a";
      base05 = "#e0e0e0";
      base06 = "#e0e0e0";
      base07 = "#ffffff";
      base08 = "${settings.red}";
      base09 = "${settings.orange}";
      base0A = "${settings.yellow}";
      base0B = "${settings.teal}";
      base0C = "${settings.cyan}";
      base0D = "${settings.blue}";
      base0E = "${settings.purple}";
      base0F = "${settings.teal}";
    };

    image = ../../users/riaru/wallpaper.png;

    targets = {
      firefox.enable = false;
      kitty.enable = false;
      spicetify.enable = false;
      vscode.enable = false;
      starship.enable = false;
      waybar.enable = false;
    };
  };
}
