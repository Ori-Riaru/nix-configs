{
  pkgs,
  settings,
  inputs,
  ...
}: {
  imports = [
    inputs.stylix.homeModules.stylix
  ];

  stylix = {
    enable = true;

    fonts = {
      monospace = {
        name = settings.fontMonospace;
      };

      sansSerif = {
        name = "Inter";
      };
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };

    polarity = "dark";
    base16Scheme = {
      base00 = "${settings.section}";
      base01 = "${settings.card}";
      base02 = "${settings.accent}";
      base03 = "${settings.hidden}";
      base04 = "${settings.subtext}";
      base05 = "${settings.text}";
      base06 = "${settings.white}";
      base07 = "${settings.white}";
      base08 = "${settings.red}";
      base09 = "${settings.orange}";
      base0A = "${settings.yellow}";
      base0B = "${settings.teal}";
      base0C = "${settings.cyan}";
      base0D = "${settings.blue}";
      base0E = "${settings.purple}";
      base0F = "${settings.brown}";
    };

    image = ../../users/riaru/wallpaper.png;

    targets = {
      firefox.enable = false;
      kitty.enable = false;
      spicetify.enable = false;
      vscode.enable = false;
      starship.enable = false;
      waybar.enable = false;
      spotify-player.enable = false;
      ghostty.enable = false;
    };
  };
}
