{config, settings, ...}: {
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      confirm-close-surface = false;

      keybind = [
        "performable:ctrl+c=copy_to_clipboard"
      ];

      # Themeing
      font-family = config.theme.fontMonospace;
      font-size = 11;
      background = config.theme.section;
      foreground = config.theme.text;
      selection-foreground = config.theme.text;
      selection-background = config.theme.overlay;
      cursor-color = config.theme.accent;
      palette = [
        "0=${config.theme.base}"
        "1=${config.theme.red}"
        "2=${config.theme.teal}"
        "3=${config.theme.yellow}"
        "4=${config.theme.blue}"
        "5=${config.theme.purple}"
        "6=${config.theme.cyan}"
        "7=${config.theme.subtext}"
        "8=${config.theme.section}"
        "9=${config.theme.red-bright}"
        "10=${config.theme.teal-bright}"
        "11=${config.theme.yellow-bright}"
        "12=${config.theme.blue-bright}"
        "13=${config.theme.purple-bright}"
        "14=${config.theme.cyan-bright}"
        "15=${config.theme.text}"
      ];
    };
  };
}
