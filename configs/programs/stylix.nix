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
      base02 = "${settings.overlay}";
      base03 = "${settings.muted}";
      base04 = "${settings.subtext}";
      base05 = "${settings.text}";
      base06 = "${settings.white}";
      base07 = "${settings.purple}";
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
      spicetify.enable = false;
      vscodium.enable = false;
      ghostty.enable = false;
      fish.enable = false;
      starship.enable = false;
      spotify-player.enable = false;
      hyprlock.enable = false;
    };
  };
}
