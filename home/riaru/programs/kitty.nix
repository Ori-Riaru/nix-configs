{pkgs, ...}: {
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
      background #202020
      foreground #FFFFFF
      cursor #A080FF
      selection_foreground #202020
      selection_background #A080FF

      color1 #FF2954
      color9 #FF5271

      #: green
      color2  #61FFB3
      color10 #9FFFBC

      #: yellow
      color3  #FFA062
      color11 #FFFB77

      #: blue
      color4  #80B9FF
      color12 #ACD1FF

      #: magenta
      color5  #A080FF
      color13 #ADA0FF

      #: cyan
      color6  #8BF9FF
      color14 #B9F7FF

      #: white
      color7  #aaaaaa
      color15 #ffffff
    '';
  };
}
