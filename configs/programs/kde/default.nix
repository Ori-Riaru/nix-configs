{
  inputs,
  pkgs,
  settings,
  ...
}: {
  imports = [
    inputs.plasma-manager.homeManagerModules.plasma-manager
    ./panels.nix
    ./shortcuts.nix
  ];

  home.packages = with pkgs; [
    kdePackages.karousel
    # kdePackages.krohnkite
    simple-kickoff

    kdePackages.qtstyleplugin-kvantum

    (pkgs.papirus-icon-theme.override {color = "black";})
  ];

  programs.konsole = {
    enable = true;

    defaultProfile = settings.username;

    profiles."${settings.username}" = {
      colorScheme = "Neutral Dark";
      font.name = "JetBrainsMono Nerd Font";
    };

    customColorSchemes = {
      "Neutral Dark" = ./konsole.colorscheme;
    };
  };

  programs.plasma = {
    enable = true;
    # overrideConfig = true;

    workspace = {
      cursor = {
        theme = "Bibata-Modern-Ice";
        size = 22;
      };

      iconTheme = "Papirus-Dark";

      # Wallpaper & lockscreen
      wallpaper = "/mnt/nfs/riaru/Projects/nix-configs/users/riaru/wallpaper.png";
      clickItemTo = "open";

      colorScheme = "Neutral Dark";
      #windowDecorations
    };

    kscreenlocker.appearance.wallpaper = settings.wallpaper;

    fonts = {
      general = {
        family = "Inter Variable";
        pointSize = 12;
      };
    };

    configFile = {
      ###########
      # General #
      ###########

      # Default Applications
      "kdeglobals"."General"."TerminalApplication" = "kitty";
      "kdeglobals"."General"."TerminalService" = "kitty.desktop";
      "kdeglobals"."General"."BrowserApplication" = "firefox";

      # Highlight non default settings
      "systemsettingsrc"."systemsettings_sidebar_mode"."HighlightNonDefaultSettings" = true;

      # Animation speed
      "kdeglobals"."KDE"."AnimationDurationFactor" = 0.7071067811865475;

      #####################
      # Window Management #
      #####################

      # Focus follows mouse
      "kwinrc"."Windows"."FocusPolicy" = "FocusFollowsMouse";

      # Desktops
      "kwinrc"."Desktops"."Number" = 4;
      "kwinrc"."Desktops"."Rows" = 4;
      "kwinrc"."Windows"."RollOverDesktops" = true;

      ################
      # Kwin scripts #
      ################

      # karousel
      "kwinrc"."Plugins"."karouselEnabled" = true;
      "kwinrc"."Script-karousel"."gapsInnerHorizontal" = 0;
      "kwinrc"."Script-karousel"."gapsInnerVertical" = 0;
      "kwinrc"."Script-karousel"."gapsOuterBottom" = 0;
      "kwinrc"."Script-karousel"."gapsOuterLeft" = 0;
      "kwinrc"."Script-karousel"."gapsOuterRight" = 0;
      "kwinrc"."Script-karousel"."gapsOuterTop" = 26;
      "kwinrc"."Script-karousel"."manualScrollStep" = 150;
      "kwinrc"."Script-karousel"."reMaximize" = true;
      "kwinrc"."Script-karousel"."untileOnDrag" = true;
      "kwinrc"."Script-karousel"."tiledKeepBelow" = false;

      ###################
      # Desktop Effects #
      ###################

      # Desktop Effects
      "kwinrc"."Plugins"."kwin4_effect_geometry_changeEnabled" = true;

      # Geometry change
      "kwinrc"."Plugins"."desktopchangeosdEnabled" = false;
      "kwinrc"."Effect-kwin4_effect_geometry_change"."Duration" = 500;

      # Rounded Corners
      "kwinrc"."Round-Corners"."ActiveOutlineAlpha" = 255;
      "kwinrc"."Round-Corners"."DisableOutlineTile" = false;
      "kwinrc"."Round-Corners"."DisableRoundTile" = false;
      "kwinrc"."Round-Corners"."InactiveCornerRadius" = 6;
      "kwinrc"."Round-Corners"."InactiveOutlineAlpha" = 0;
      "kwinrc"."Round-Corners"."InactiveOutlineThickness" = 2;
      "kwinrc"."Round-Corners"."InactiveSecondOutlineThickness" = 0;
      "kwinrc"."Round-Corners"."OutlineColor" = "160,128,255";
      "kwinrc"."Round-Corners"."OutlineThickness" = 2;
      "kwinrc"."Round-Corners"."SecondOutlineThickness" = 0;
      "kwinrc"."Round-Corners"."Size" = 6;

      # Highlight edge effects
      "kwinrc"."Plugins"."screenedgeEnabled" = false;

      # Overview
      "kwinrc"."Effect-overview"."BorderActivate" = 2;

      # Virtual Desktop transition
      "kwinrc"."Effect-slide"."HorizontalGap" = 0;
      "kwinrc"."Effect-slide"."SlideBackground" = false;
      "kwinrc"."Effect-slide"."VerticalGap" = 0;

      ##########
      # Themes #
      ##########

      "kdeglobals"."General"."AccentColor" = "160,128,255";
      # "kdeglobals"."General"."LastUsedCustomAccentColor" = "160,128,255";
      # "kdeglobals"."WM"."activeBackground" = "49,54,59";
      # "kdeglobals"."WM"."activeBlend" = "252,252,252";
      # "kdeglobals"."WM"."activeForeground" = "252,252,252";
      # "kdeglobals"."WM"."inactiveBackground" = "42,46,50";
      # "kdeglobals"."WM"."inactiveBlend" = "161,169,177";
      # "kdeglobals"."WM"."inactiveForeground" = "161,169,177";

      # Widget style
      "kdeglobals"."KDE"."widgetStyle" = "Breeze";

      # Start Splash screen
      "ksplashrc"."KSplash"."Engine" = "none";
      "ksplashrc"."KSplash"."Theme" = "None";

      # Subpixel font rendering
      "kdeglobals"."General"."XftAntialias" = true;
      "kdeglobals"."General"."XftHintStyle" = "hintslight";
      "kdeglobals"."General"."XftSubPixel" = "rgb";

      # Disable cursor loading animation
      "klaunchrc"."BusyCursorSettings"."Bouncing" = false;
      "klaunchrc"."FeedbackStyle"."BusyCursor" = false;

      ############
      # Keyboard #
      ############

      "kxkbrc"."Layout"."DisplayNames" = ",";
      "kxkbrc"."Layout"."LayoutList" = "us,us";
      "kxkbrc"."Layout"."Model" = "trust_slimline";
      "kxkbrc"."Layout"."Use" = true;
      "kxkbrc"."Layout"."VariantList" = "dvorak,";
      "kxkbrc"."Layout"."Options" = "ctrl:nocaps";
      "kxkbrc"."Layout"."ResetOldOptions" = true;

      ###########
      # Krunner #
      ###########

      "krunnerrc"."General"."FreeFloating" = true;
      "krunnerrc"."General"."historyBehavior" = "ImmediateCompletion";
      "krunnerrc"."Plugins"."baloosearchEnabled" = true;
      "krunnerrc"."Plugins"."krunner_powerdevilEnabled" = true;
      "krunnerrc"."Plugins/Favorites"."plugins" = "windows,krunner_services,browsertabs,krunner_bookmarksrunner,calculator,org.kde.datetime,krunner_webshortcuts,krunner_powerdevil";

      ##########
      # System #
      ##########
      "ksmserverrc"."General"."confirmLogout" = false;

      ##################
      # Input & Output #
      ##################

      # Disable edge and corner barriers
      "kwinrc"."EdgeBarrier"."CornerBarrier" = false;
      "kwinrc"."EdgeBarrier"."EdgeBarrier" = 0;

      # Laptop track pad
      "kcminputrc"."Libinput/1739/52542/MSFT0001:01 06CB:CD3E Touchpad"."ClickMethod" = 2;
      "kcminputrc"."Libinput/1739/52542/MSFT0001:01 06CB:CD3E Touchpad"."PointerAcceleration" = 0.400;
      "kcminputrc"."Libinput/1739/52542/MSFT0001:01 06CB:CD3E Touchpad"."ScrollFactor" = 0.5;

      # G502 mouse
      "kcminputrc"."Libinput/1133/49970/Logitech Gaming Mouse G502"."PointerAccelerationProfile" = 1;
      "kcminputrc"."Libinput/9610/16/Hailuck Co.,Ltd PTP TouchPad Touchpad"."ClickMethod" = 2;
      "kcminputrc"."Libinput/9610/16/Hailuck Co.,Ltd PTP TouchPad Touchpad"."DisableWhileTyping" = false;
      "kcminputrc"."Libinput/9610/16/Hailuck Co.,Ltd PTP TouchPad Touchpad"."PointerAcceleration" = 0.600;
      "kcminputrc"."Libinput/9610/16/Hailuck Co.,Ltd PTP TouchPad Touchpad"."TapDragLock" = true;
    };
  };

  
}
