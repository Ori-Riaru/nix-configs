{...}: {
  programs.plasma = {
    shortcuts = {
      kwin = {
        # Window management
        "Window Close" = "Meta+Z";
        "Window Maximize" = "Meta+M";
        "Window Minimize" = "Meta+W";

        # Switch desktops
        "Switch to Next Desktop" = "Meta+R";
        "Switch to Previous Desktop" = "Meta+C";
        "Window to Next Desktop" = "Meta+Shift+R";
        "Window to Previous Desktop" = "Meta+Shift+C";

        # Karousel change focus
        "karousel-focus-down" = "Meta+N";
        "karousel-focus-left" = [
          "Meta+H"
          "Meta+Ctrl+Tab"
        ];
        "karousel-focus-right" = [
          "Meta+S"
          "Meta+Tab"
        ];
        "karousel-focus-up" = "Meta+T";

        # Karousel move window
        "karousel-window-move-down" = "Meta+Shift+N";
        "karousel-window-move-left" = ["Meta+Ctrl+Shift+Tab" "Meta+Shift+H"];
        "karousel-window-move-right" = ["Meta+Shift+S" "Meta+Shift+Tab"];
        "karousel-window-move-up" = "Meta+Shift+T";
        "karousel-window-toggle-floating" = "Meta+Space";
      };

      # Keyboard Layouts
      "KDE Keyboard Layout Switcher"."Switch to Next Keyboard Layout" = "Meta+Alt+Space,Meta+Alt+K,Switch to Next Keyboard Layout";

      "plasmashell"."activate application launcher" = "Meta";
      "services/org.kde.krunner.desktop"."_launch" = "Alt";
    };
  };
}
