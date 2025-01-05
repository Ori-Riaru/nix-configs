{inputs, ...}: {
  imports = [
    inputs.stylix.homeManagerModules.stylix
  ];

  stylix = {
    enable = true;
    autoEnable = false;
    image = ../../../../dotfiles/wallpaper.jpg;

    base16Scheme = {
      base00 = "111111"; #252525 ----
      base01 = "232323"; #353535 ---
      base02 = "a080ff"; #a080ff --
      base03 = "232323"; #AAAAAA -
      base04 = "232323"; #454545 +
      base05 = "FFFFFF"; #AAAAAA ++
      base06 = "FFFFFF"; #FFFFFF +++
      base07 = "232323"; #FFFFFF ++++
      base08 = "a080ff"; #FF2954 red
      base09 = "a080ff"; #FFA062 orange
      base0A = "a080ff"; #FFFB77 yellow
      base0B = "a080ff"; #61FFB3 green
      base0C = "a080ff"; #8BF9FF aqua/cyan
      base0D = "a080ff"; #80B9FF blue
      base0E = "a080ff"; #a080ff purple
      base0F = "a080ff"; #B58464 brown
    };
  };
}
