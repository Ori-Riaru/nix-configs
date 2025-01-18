{settings, ...}: {
  programs.plasma = {
    panels = [
      {
        location = "top";
        height = 26;

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
                activeText = "■";
                inactiveText = "▢";
                dotSizeCustom = 22;
                spacingHorizontal = 14;
              };
            };
          }

          "org.kde.plasma.panelspacer"

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

          "org.kde.plasma.panelspacer"

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
            plasmaPanelColorizer = {
              general = {
                hideWidget = true;
              };

              widgetBackground = {
                enable = true;

                colors = {
                  source = "customList";
                  customColorList = ["${settings.accent}" "${settings.accent}" "${settings.accent}" "${settings.base}" "${settings.base}" "${settings.base}" "${settings.base}" "${settings.red}" "${settings.teal}" "${settings.base}" "${settings.accent}" "${settings.accent}" "${settings.accent} "];
                };

                shape = {
                  opacity = 1;
                  radius = 6;
                  outline = {
                    colorSource = "custom";
                    customColor = "${settings.text}";
                    opacity = 0.1;
                    width = 2;
                  };
                };
              };

              panelBackground = {
                originalBackground = {
                  hide = true;
                };
              };

              layout = {
                enable = true;
                backgroundMargin = {
                  spacing = 4;
                  vertical = 0;
                  horizontal = 2;
                };
              };
            };
          }
        ];

        floating = false;
        hiding = "dodgewindows";
      }
    ];
  };
}
