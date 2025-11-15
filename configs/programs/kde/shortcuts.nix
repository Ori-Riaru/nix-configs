{
  programs.plasma = {
    shortcuts = {
      kwin = {
        # Window management
        "Window Close" = "Meta+Q";
        "Window Maximize" = "Meta+F";
        "Window Fullscreen" = "Meta+Shift+F";
        "Window Minimize" = "Meta+W";
        "Window Toggle Floating" = "Meta+W";

        # Switch desktops (keeping your original desktop switching)
        "Switch to Next Desktop" = "Meta+Down";
        "Switch to Previous Desktop" = "Meta+Up";
        "Window to Next Desktop" = "Meta+Ctrl+Down";
        "Window to Previous Desktop" = "Meta+Ctrl+Up";

        # Window Focus
        "Window Focus Up" = "Meta+Up";
        "Window Focus Down" = "Meta+Down";
        "Window Focus Left" = "Meta+Left";
        "Window Focus Right" = "Meta+Right";

        # Window Movement
        "Window Move Up" = "Meta+Ctrl+Up";
        "Window Move Down" = "Meta+Ctrl+Down";
        "Window Move Left" = "Meta+Ctrl+Left";
        "Window Move Right" = "Meta+Ctrl+Right";

        # Monitor Management
        "Window to Next Screen" = "Ctrl+Meta+D";
        "Switch to Screen 0" = "Meta+1";
        "Switch to Screen 1" = "Meta+2";
        "Switch to Screen 2" = "Meta+3";
        "Window to Screen 0" = "Ctrl+Meta+1";
        "Window to Screen 1" = "Ctrl+Meta+2";
        "Window to Screen 2" = "Ctrl+Meta+3";

        # Overview/Present Windows
        "Overview" = "Meta+O";

        # Column width adjustment (KDE equivalent - tile resizing)
        "Window Grow Horizontal" = "Meta+R";
        "Window Shrink Horizontal" = "Ctrl+Meta+R";
        "Window Maximize Horizontal" = "Shift+Meta+R";

        # Center window
        "Window Quick Tile Center" = "Meta+C";
      };

      # System controls
      "ksmserver"."Lock Session" = "Meta+Ctrl+L";

      # Keyboard Layouts
      "KDE Keyboard Layout Switcher"."Switch to Next Keyboard Layout" = "Meta+Alt+Space";

      # Application launcher
      "plasmashell"."activate application launcher" = "Meta+G";

      # Clipboard manager (if you have one installed)
      "org.kde.plasma.clipboard"."show-clipboard" = "Meta+V";

      # Terminal
      "services/org.kde.konsole.desktop"."_launch" = "Meta+T";

      # Screenshots
      "spectacle"."ActiveWindowScreenShot" = "Alt+Print";
      "spectacle"."CurrentMonitorScreenShot" = "Ctrl+Print";
      "spectacle"."RectangularRegionScreenShot" = "Meta+P";
    };
  };
}
