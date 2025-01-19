{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.plasma-manager.homeManagerModules.plasma-manager
    ./panels.nix
  ];

  home.packages = with pkgs; [
    # dracula-icon-theme
    kdePackages.karousel
    kdePackages.krohnkite
    plasmusic-toolbar
    kara
    tela-icon-theme
    bibata-cursors
    simple-kickoff
  ];

  programs.plasma = {
    enable = true;

    workspace = {
      cursor = {
        theme = "Bibata-Modern-Ice";
        size = 22;
      };

      iconTheme = "Tela-black-dark";

      clickItemTo = "open";

      wallpaperPlainColor = "21,21,21,255";
    };

    fonts = {
      general = {
        family = "Inter Variable";
        pointSize = 12;
      };
    };

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

    configFile = {
      # Default Terminal
      "kdeglobals"."General"."TerminalApplication" = "kitty";
      "kdeglobals"."General"."TerminalService" = "kitty.desktop";

      # Virtual Desktops
      "kwinrc"."Desktops"."Number" = 4;
      "kwinrc"."Desktops"."Rows" = 4;

      # One of these will have to be disabled
      "kwinrc"."Plugins"."krohnkiteEnabled" = true;

      # Karousel
      "kwinrc"."Plugins"."karouselEnabled" = false;

      "kwinrc"."Script-karousel"."gapsInnerHorizontal" = 0;
      "kwinrc"."Script-karousel"."gapsInnerVertical" = 0;
      "kwinrc"."Script-karousel"."gapsOuterBottom" = 0;
      "kwinrc"."Script-karousel"."gapsOuterLeft" = 0;
      "kwinrc"."Script-karousel"."gapsOuterRight" = 0;
      "kwinrc"."Script-karousel"."gapsOuterTop" = 26;
      "kwinrc"."Script-karousel"."manualScrollStep" = 150;
      "kwinrc"."Script-karousel"."reMaximize" = true;
      "kwinrc"."Script-karousel"."untileOnDrag" = true;

      # Desktop Effects
      "kwinrc"."Plugins"."kwin4_effect_geometry_changeEnabled" = true;
      "kwinrc"."Plugins"."desktopchangeosdEnabled" = false;
      "kwinrc"."Effect-kwin4_effect_geometry_change"."Duration" = 500;

      "kwinrc"."ًRound-Corners"."AnimationEnabled" = false;
      "kwinrc"."ًRound-Corners"."InactiveCornerRadius" = 7;
      "kwinrc"."ًRound-Corners"."InactiveShadowSize" = 5;
      "kwinrc"."ًRound-Corners"."ShadowSize" = 5;
      "kwinrc"."ًRound-Corners"."Size" = 7;

      "kwinrc"."PrimaryOutline"."InactiveOutlineAlpha" = 136;
      "kwinrc"."PrimaryOutline"."InactiveOutlineColor" = "117,117,117";
      "kwinrc"."PrimaryOutline"."InactiveOutlineThickness" = 2.5;
      "kwinrc"."PrimaryOutline"."OutlineColor" = "160,128,255";
      "kwinrc"."PrimaryOutline"."OutlineThickness" = 2.5;

      "kwinrc"."SecondOutline"."InactiveSecondOutlineThickness" = 0;
      "kwinrc"."SecondOutline"."SecondOutlineThickness" = 0;
      "kwinrc"."MaximizeTile"."DisableOutlineMaximize" = true;
      "kwinrc"."MaximizeTile"."DisableOutlineTile" = false;

      "kwinrc"."Plugins"."screenedgeEnabled" = false;

      # Theming
      "plasmarc"."Theme"."name" = "Materia";

      "kwinrc"."org.kde.kdecoration2"."theme" = "Breeze";
      "kdeglobals"."KDE"."widgetStyle" = "kvantum-dark";

      "klaunchrc"."BusyCursorSettings"."Bouncing" = false;
      "klaunchrc"."FeedbackStyle"."BusyCursor" = false;

      "kdeglobals"."General"."XftAntialias" = true;
      "kdeglobals"."General"."XftHintStyle" = "hintslight";
      "kdeglobals"."General"."XftSubPixel" = "rgb";

      "kdeglobals"."General"."AccentColor" = "160,128,255";
      "kdeglobals"."General"."LastUsedCustomAccentColor" = "160,128,255";

      "kdeglobals"."WM"."activeBackground" = "49,54,59";
      "kdeglobals"."WM"."activeBlend" = "252,252,252";
      "kdeglobals"."WM"."activeForeground" = "252,252,252";
      "kdeglobals"."WM"."inactiveBackground" = "42,46,50";
      "kdeglobals"."WM"."inactiveBlend" = "161,169,177";
      "kdeglobals"."WM"."inactiveForeground" = "161,169,177";

      "ksplashrc"."KSplash"."Engine" = "none";
      "ksplashrc"."KSplash"."Theme" = "None";

      # Krunner
      "krunnerrc"."General"."FreeFloating" = true;
      "krunnerrc"."General"."historyBehavior" = "ImmediateCompletion";
      "krunnerrc"."Plugins"."baloosearchEnabled" = true;
      "krunnerrc"."Plugins"."krunner_powerdevilEnabled" = true;
      "krunnerrc"."Plugins/Favorites"."plugins" = "windows,krunner_services,browsertabs,krunner_bookmarksrunner,calculator,org.kde.datetime,krunner_webshortcuts,krunner_powerdevil";

      # Settings app
      "systemsettingsrc"."systemsettings_sidebar_mode"."HighlightNonDefaultSettings" = true;

      # Dolphin
      # "dolphinrc"."ContextMenu"."ShowAddToPlaces" = false;
      # "dolphinrc"."General"."BrowseThroughArchives" = true;
      # "dolphinrc"."General"."FilterBar" = true;
      # "dolphinrc"."General"."ShowFullPath" = true;
      # "dolphinrc"."General"."ShowStatusBar" = false;

      "kxkbrc"."Layout"."DisplayNames" = ",";
      "kxkbrc"."Layout"."LayoutList" = "us,us";
      "kxkbrc"."Layout"."Model" = "trust_slimline";
      "kxkbrc"."Layout"."Use" = true;
      "kxkbrc"."Layout"."VariantList" = "dvorak,";

      # Misc
      "kwinrc"."Windows"."FocusPolicy" = "FocusFollowsMouse";
      "ksmserverrc"."General"."confirmLogout" = false;

      #! SYSTEM SPECIFIC
      "kcminputrc"."Libinput/1133/49970/Logitech Gaming Mouse G502"."PointerAccelerationProfile" = 1;
      "kcminputrc"."Libinput/9610/16/Hailuck Co.,Ltd PTP TouchPad Touchpad"."ClickMethod" = 2;
      "kcminputrc"."Libinput/9610/16/Hailuck Co.,Ltd PTP TouchPad Touchpad"."DisableWhileTyping" = false;
      "kcminputrc"."Libinput/9610/16/Hailuck Co.,Ltd PTP TouchPad Touchpad"."PointerAcceleration" = 0.600;
      "kcminputrc"."Libinput/9610/16/Hailuck Co.,Ltd PTP TouchPad Touchpad"."TapDragLock" = true;
    };
  };
}
