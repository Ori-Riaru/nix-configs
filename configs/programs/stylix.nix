{
  pkgs,
  config,
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
        name = config.theme.fontMonospace;
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
      base00 = "${config.theme.section}";
      base01 = "${config.theme.card}";
      base02 = "${config.theme.overlay}";
      base03 = "${config.theme.muted}";
      base04 = "${config.theme.subtext}";
      base05 = "${config.theme.text}";
      base06 = "${config.theme.white}";
      base07 = "${config.theme.purple}";
      base08 = "${config.theme.red}";
      base09 = "${config.theme.orange}";
      base0A = "${config.theme.yellow}";
      base0B = "${config.theme.teal}";
      base0C = "${config.theme.cyan}";
      base0D = "${config.theme.blue}";
      base0E = "${config.theme.purple}";
      base0F = "${config.theme.brown}";
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
