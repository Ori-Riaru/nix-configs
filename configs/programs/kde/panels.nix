{
  settings,
  lib,
  ...
}: {
  programs.plasma = {
    panels = [
      {
        location = "top";
        height = 26;
        hiding = "normalpanel";
        floating = false;
        screen = "all";

        widgets = [
          "org.kde.plasma.notifications"

          {
            digitalClock = {
              settings = {
                showDate = false;
              };
            };
          }

          {
            name = "org.dhruv8sh.kara";
            config = {
              General = {
                animationDuration = 210;
                highlightOpacityFull = false;
                highlightType = 0;
                spacing = 4;
                type = 0;
              };
              type1 = {
                t1activeHeight = 16;
                t1activeWidth = 16;
                t1height = 16;
                t1radius = 2;
                t1width = 16;
              };
            };
          }

          {
            panelSpacer = {};
          }

          {
            plasmusicToolbar = {
              panelIcon = {
                albumCover = {
                  useAsIcon = true;
                  radius = 6;
                };
              };
              musicControls.showPlaybackControls = false;
              songText = {
                maximumWidth = 125;
                scrolling = {
                  behavior = "alwaysScroll";
                  speed = 3;
                };
              };
            };
          }

          {
            iconTasks = {
              launchers = [];

              behavior = {
                sortingMethod = "manually";
                showTasks = {
                  onlyMinimized = true;
                };
              };
            };
          }

          {
            name = "org.kde.plasma.taskmanager";
            config = {
              General = {
                groupingStrategy = 0;
                showOnlyCurrentScreen = true;
                fill = false;
                launchers = "";
              };
            };
          }

          {
            applicationTitleBar = {
              layout = {
                elements = ["windowCloseButton"];
              };
            };
          }

          {
            name = "org.kde.plasma.simplekickoff";
            config = {
              General = {
                icon = "add";
              };
            };
          }

          {
            panelSpacer = {};
          }

          "org.kde.plasma.clipboard"

          "org.kde.plasma.colorpicker"

          {
            systemTray.items = {
              # We explicitly show bluetooth and battery
              shown = [
                "org.kde.plasma.volume"
              ];
              # And explicitly hide networkmanagement and volume
              hidden = [
                "steam"
                "chrome_status_icon_1" # Discord icon
                "org.kde.plasma.battery"
                "org.kde.plasma.bluetooth"
                "org.kde.plasma.networkmanagement"
                "org.kde.plasma.brightness"
                "org.kde.plasma.mediacontroller"
                "org.kde.plasma.clipboard"
              ];
            };
          }

          {
            name = "luisbocanegra.panel.colorizer";
            config = {
              General = {
                isEnabled = true;
                hideWidget = false;
                enableDebug = false;
                globalSettings = lib.escape ["\"" "\\"] (builtins.toJSON {
                  
                });
              };
            };
          }
        ];
      }
    ];
  };
}
