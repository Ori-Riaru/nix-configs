{
  pkgs,
  settings,
  ...
}: {
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      confirm-close-surface = false;

      keybind = [
        "performable:ctrl+c=copy_to_clipboard"
      ];

      # Themeing
      font-family = settings.fontMonospace;
      font-size = 11;
      background = settings.section;
      foreground = settings.text;
      selection-foreground = settings.base;
      selection-background = settings.accent;
      cursor-color = settings.accent;
      palette = [
        "0=${settings.black}"
        "8=${settings.subtext}"
        "1=${settings.red}"
        "9=#FF5271"
        "2=${settings.teal}"
        "10=#9FFFBC"
        "3=${settings.orange}"
        "11=${settings.yellow}"
        "4=${settings.blue}"
        "12=#ACD1FF"
        "5=${settings.purple}"
        "13=#ADA0FF"
        "6=${settings.cyan}"
        "14=#B9F7FF"
        "7=${settings.subtext}"
        "15=${settings.text}"
      ];
    };
  };
}
