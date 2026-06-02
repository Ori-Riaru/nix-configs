{settings, ...}: {
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      bold-is-bright = true;
      confirm-close-surface = false;

      keybind = [
        "performable:ctrl+c=copy_to_clipboard"
      ];

      # Themeing
      font-family = settings.fontMonospace;
      font-size = 11;
      background = settings.section;
      foreground = settings.text;
      selection-foreground = settings.text;
      selection-background = settings.overlay;
      cursor-color = settings.accent;
      palette = [
        "0=${settings.base}"
        "1=${settings.red}"
        "2=${settings.teal}"
        "3=${settings.yellow}"
        "4=${settings.blue}"
        "5=${settings.purple}"
        "6=${settings.cyan}"
        "7=${settings.subtext}"
        "8=${settings.section}"
        "9=${settings.red-bright}"
        "10=${settings.teal-bright}"
        "11=${settings.yellow-bright}"
        "12=${settings.blue-bright}"
        "13=${settings.purple-bright}"
        "14=${settings.cyan-bright}"
        "15=${settings.text}"
      ];
    };
  };
}
