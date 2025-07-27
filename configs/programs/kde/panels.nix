{settings, ...}: {
  programs.plasma = {
    panels = [
      {
        location = "top";
        height = 26;
        hiding = "dodgewindows";
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

          # {
          #   name = "luisbocanegra.panel.colorizer";
          #   config = {
          #     General = {
          #       isEnabled = true;
          #       hideWidget = false;
          #       enableDebug = false;
          #       globalSettings = builtins.toJSON {
          #         panel = {
          #           enabled = false;
          #           blurBehind = false;
          #           backgroundColor = {
          #             enabled = true;
          #             lightnessValue = 0.5;
          #             saturationValue = 0.5;
          #             alpha = 1;
          #             systemColor = "backgroundColor";
          #             systemColorSet = "View";
          #             custom = "#013eff";
          #             list = [
          #               "#ED8796"
          #               "#A6DA95"
          #               "#EED49F"
          #               "#8AADF4"
          #               "#F5BDE6"
          #               "#8BD5CA"
          #               "#f5a97f"
          #             ];
          #             followColor = 0;
          #             saturationEnabled = false;
          #             lightnessEnabled = false;
          #             animation = {
          #               enabled = false;
          #               interval = 3000;
          #               smoothing = 800;
          #             };
          #             sourceType = 1;
          #           };
          #           foregroundColor = {
          #             enabled = false;
          #             lightnessValue = 0.5;
          #             saturationValue = 0.5;
          #             alpha = 1;
          #             systemColor = "highlightColor";
          #             systemColorSet = "View";
          #             custom = "#fc0000";
          #             list = [
          #               "#ED8796"
          #               "#A6DA95"
          #               "#EED49F"
          #               "#8AADF4"
          #               "#F5BDE6"
          #               "#8BD5CA"
          #               "#f5a97f"
          #             ];
          #             followColor = 0;
          #             saturationEnabled = false;
          #             lightnessEnabled = false;
          #             animation = {
          #               enabled = false;
          #               interval = 3000;
          #               smoothing = 800;
          #             };
          #             sourceType = 1;
          #           };
          #           radius = {
          #             enabled = false;
          #             corner = {
          #               topLeft = 5;
          #               topRight = 5;
          #               bottomRight = 5;
          #               bottomLeft = 5;
          #             };
          #           };
          #           margin = {
          #             enabled = false;
          #             side = {
          #               right = 0;
          #               left = 0;
          #               top = 0;
          #               bottom = 0;
          #             };
          #           };
          #           padding = {
          #             enabled = false;
          #             side = {
          #               right = 0;
          #               left = 0;
          #               top = 0;
          #               bottom = 0;
          #             };
          #           };
          #           border = {
          #             enabled = false;
          #             customSides = false;
          #             custom = {
          #               widths = {
          #                 left = 0;
          #                 bottom = 3;
          #                 right = 0;
          #                 top = 0;
          #               };
          #               margin = {
          #                 enabled = false;
          #                 side = {
          #                   right = 0;
          #                   left = 0;
          #                   top = 0;
          #                   bottom = 0;
          #                 };
          #               };
          #               radius = {
          #                 enabled = false;
          #                 corner = {
          #                   topLeft = 5;
          #                   topRight = 5;
          #                   bottomRight = 5;
          #                   bottomLeft = 5;
          #                 };
          #               };
          #             };
          #             width = 0;
          #             color = {
          #               lightnessValue = 0.5;
          #               saturationValue = 0.5;
          #               alpha = 1;
          #               systemColor = "highlightColor";
          #               systemColorSet = "View";
          #               custom = "#ff6c06";
          #               list = [
          #                 "#ED8796"
          #                 "#A6DA95"
          #                 "#EED49F"
          #                 "#8AADF4"
          #                 "#F5BDE6"
          #                 "#8BD5CA"
          #                 "#f5a97f"
          #               ];
          #               followColor = 0;
          #               saturationEnabled = false;
          #               lightnessEnabled = false;
          #               animation = {
          #                 enabled = false;
          #                 interval = 3000;
          #                 smoothing = 800;
          #               };
          #               sourceType = 1;
          #               enabled = true;
          #             };
          #           };
          #           borderSecondary = {
          #             enabled = false;
          #             customSides = false;
          #             custom = {
          #               widths = {
          #                 left = 0;
          #                 bottom = 3;
          #                 right = 0;
          #                 top = 0;
          #               };
          #               margin = {
          #                 enabled = false;
          #                 side = {
          #                   right = 0;
          #                   left = 0;
          #                   top = 0;
          #                   bottom = 0;
          #                 };
          #               };
          #               radius = {
          #                 enabled = false;
          #                 corner = {
          #                   topLeft = 5;
          #                   topRight = 5;
          #                   bottomRight = 5;
          #                   bottomLeft = 5;
          #                 };
          #               };
          #             };
          #             width = 0;
          #             color = {
          #               lightnessValue = 0.5;
          #               saturationValue = 0.5;
          #               alpha = 1;
          #               systemColor = "highlightColor";
          #               systemColorSet = "View";
          #               custom = "#ff6c06";
          #               list = [
          #                 "#ED8796"
          #                 "#A6DA95"
          #                 "#EED49F"
          #                 "#8AADF4"
          #                 "#F5BDE6"
          #                 "#8BD5CA"
          #                 "#f5a97f"
          #               ];
          #               followColor = 0;
          #               saturationEnabled = false;
          #               lightnessEnabled = false;
          #               animation = {
          #                 enabled = false;
          #                 interval = 3000;
          #                 smoothing = 800;
          #               };
          #               sourceType = 1;
          #               enabled = true;
          #             };
          #           };
          #           shadow = {
          #             background = {
          #               enabled = false;
          #               color = {
          #                 lightnessValue = 0.5;
          #                 saturationValue = 0.5;
          #                 alpha = 1;
          #                 systemColor = "backgroundColor";
          #                 systemColorSet = "View";
          #                 custom = "#282828";
          #                 list = [
          #                   "#ED8796"
          #                   "#A6DA95"
          #                   "#EED49F"
          #                   "#8AADF4"
          #                   "#F5BDE6"
          #                   "#8BD5CA"
          #                   "#f5a97f"
          #                 ];
          #                 followColor = 0;
          #                 saturationEnabled = false;
          #                 lightnessEnabled = false;
          #                 animation = {
          #                   enabled = false;
          #                   interval = 3000;
          #                   smoothing = 800;
          #                 };
          #                 sourceType = 1;
          #                 enabled = true;
          #               };
          #               size = 5;
          #               xOffset = 0;
          #               yOffset = 0;
          #             };
          #             foreground = {
          #               enabled = false;
          #               color = {
          #                 lightnessValue = 0.5;
          #                 saturationValue = 0.5;
          #                 alpha = 1;
          #                 systemColor = "backgroundColor";
          #                 systemColorSet = "View";
          #                 custom = "#282828";
          #                 list = [
          #                   "#ED8796"
          #                   "#A6DA95"
          #                   "#EED49F"
          #                   "#8AADF4"
          #                   "#F5BDE6"
          #                   "#8BD5C4"
          #                   "#f5a97f"
          #                 ];
          #                 followColor = 0;
          #                 saturationEnabled = false;
          #                 lightnessEnabled = false;
          #                 animation = {
          #                   enabled = false;
          #                   interval = 3000;
          #                   smoothing = 800;
          #                 };
          #                 sourceType = 1;
          #                 enabled = true;
          #               };
          #               size = 5;
          #               xOffset = 0;
          #               yOffset = 0;
          #             };
          #           };
          #           floatingDialogs = false;
          #         };
          #         widgets = {
          #           enabled = true;
          #           blurBehind = false;
          #           backgroundColor = {
          #             enabled = true;
          #             lightnessValue = 0.5;
          #             saturationValue = 0.5;
          #             alpha = 1;
          #             systemColor = "backgroundColor";
          #             systemColorSet = "View";
          #             custom = "#013efF";
          #             list = [
          #               "#a080fF"
          #               "#a080fF"
          #               "#a080fF"
          #               "#181818"
          #               "#181818"
          #               "#181818"
          #               "#181818"
          #               "#ff596b"
          #               "#99ff82"
          #               "#181818"
          #               "#a080fF"
          #               "#a080fF"
          #               "#a080ff"
          #             ];
          #             followColor = 0;
          #             saturationEnabled = false;
          #             lightnessEnabled = false;
          #             animation = {
          #               enabled = false;
          #               interval = 3000;
          #               smoothing = 800;
          #             };
          #             sourceType = 2;
          #           };
          #           foregroundColor = {
          #             enabled = false;
          #             lightnessValue = 0.5;
          #             saturationValue = 0.5;
          #             alpha = 1;
          #             systemColor = "highlightColor";
          #             systemColorSet = "View";
          #             custom = "#fc0000";
          #             list = [
          #               "#ED8796"
          #               "#A6DA95"
          #               "#EED49F"
          #               "#8AADF4"
          #               "#F5BDE6"
          #               "#8BD5C4"
          #               "#f5a97f"
          #             ];
          #             followColor = 0;
          #             saturationEnabled = false;
          #             lightnessEnabled = false;
          #             animation = {
          #               enabled = false;
          #               interval = 3000;
          #               smoothing = 800;
          #             };
          #             sourceType = 1;
          #           };
          #           radius = {
          #             enabled = true;
          #             corner = {
          #               topLeft = 5;
          #               topRight = 5;
          #               bottomRight = 5;
          #               bottomLeft = 5;
          #             };
          #           };
          #           margin = {
          #             enabled = true;
          #             side = {
          #               right = 0;
          #               left = 0;
          #               top = 2;
          #               bottom = 2;
          #             };
          #           };
          #           spacing = 4;
          #           border = {
          #             enabled = false;
          #             customSides = false;
          #             custom = {
          #               widths = {
          #                 left = 0;
          #                 bottom = 3;
          #                 right = 0;
          #                 top = 0;
          #               };
          #               margin = {
          #                 enabled = false;
          #                 side = {
          #                   right = 0;
          #                   left = 0;
          #                   top = 0;
          #                   bottom = 0;
          #                 };
          #               };
          #               radius = {
          #                 enabled = false;
          #                 corner = {
          #                   topLeft = 5;
          #                   topRight = 5;
          #                   bottomRight = 5;
          #                   bottomLeft = 5;
          #                 };
          #               };
          #             };
          #             width = 0;
          #             color = {
          #               lightnessValue = 0.5;
          #               saturationValue = 0.5;
          #               alpha = 1;
          #               systemColor = "highlightColor";
          #               systemColorSet = "View";
          #               custom = "#ff6c06";
          #               list = [
          #                 "#ED8796"
          #                 "#A6DA95"
          #                 "#EED49F"
          #                 "#8AADF4"
          #                 "#F5BDE6"
          #                 "#8BD5C4"
          #                 "#f5a97f"
          #               ];
          #               followColor = 0;
          #               saturationEnabled = false;
          #               lightnessEnabled = false;
          #               animation = {
          #                 enabled = false;
          #                 interval = 3000;
          #                 smoothing = 800;
          #               };
          #               sourceType = 1;
          #               enabled = true;
          #             };
          #           };
          #           borderSecondary = {
          #             enabled = false;
          #             customSides = false;
          #             custom = {
          #               widths = {
          #                 left = 0;
          #                 bottom = 3;
          #                 right = 0;
          #                 top = 0;
          #               };
          #               margin = {
          #                 enabled = false;
          #                 side = {
          #                   right = 0;
          #                   left = 0;
          #                   top = 0;
          #                   bottom = 0;
          #                 };
          #               };
          #               radius = {
          #                 enabled = false;
          #                 corner = {
          #                   topLeft = 5;
          #                   topRight = 5;
          #                   bottomRight = 5;
          #                   bottomLeft = 5;
          #                 };
          #               };
          #             };
          #             width = 0;
          #             color = {
          #               lightnessValue = 0.5;
          #               saturationValue = 0.5;
          #               alpha = 1;
          #               systemColor = "highlightColor";
          #               systemColorSet = "View";
          #               custom = "#ff6c06";
          #               list = [
          #                 "#ED8796"
          #                 "#A6DA95"
          #                 "#EED49F"
          #                 "#8AADF4"
          #                 "#F5BDE6"
          #                 "#8BD5C4"
          #                 "#f5a97f"
          #               ];
          #               followColor = 0;
          #               saturationEnabled = false;
          #               lightnessEnabled = false;
          #               animation = {
          #                 enabled = false;
          #                 interval = 3000;
          #                 smoothing = 800;
          #               };
          #               sourceType = 1;
          #               enabled = true;
          #             };
          #           };
          #           shadow = {
          #             background = {
          #               enabled = false;
          #               color = {
          #                 lightnessValue = 0.5;
          #                 saturationValue = 0.5;
          #                 alpha = 1;
          #                 systemColor = "backgroundColor";
          #                 systemColorSet = "View";
          #                 custom = "#282828";
          #                 list = [
          #                   "#ED8796"
          #                   "#A6DA95"
          #                   "#EED49F"
          #                   "#8AADF4"
          #                   "#F5BDE6"
          #                   "#8BD5C4"
          #                   "#f5a97f"
          #                 ];
          #                 followColor = 0;
          #                 saturationEnabled = false;
          #                 lightnessEnabled = false;
          #                 animation = {
          #                   enabled = false;
          #                   interval = 3000;
          #                   smoothing = 800;
          #                 };
          #                 sourceType = 1;
          #                 enabled = true;
          #               };
          #               size = 5;
          #               xOffset = 0;
          #               yOffset = 0;
          #             };
          #             foreground = {
          #               enabled = false;
          #               color = {
          #                 lightnessValue = 0.5;
          #                 saturationValue = 0.5;
          #                 alpha = 1;
          #                 systemColor = "backgroundColor";
          #                 systemColorSet = "View";
          #                 custom = "#282828";
          #                 list = [
          #                   "#ED8796"
          #                   "#A6DA95"
          #                   "#EED49F"
          #                   "#8AADF4"
          #                   "#F5BDE6"
          #                   "#8BD5C4"
          #                   "#f5a97f"
          #                 ];
          #                 followColor = 0;
          #                 saturationEnabled = false;
          #                 lightnessEnabled = false;
          #                 animation = {
          #                   enabled = false;
          #                   interval = 3000;
          #                   smoothing = 800;
          #                 };
          #                 sourceType = 1;
          #                 enabled = true;
          #               };
          #               size = 5;
          #               xOffset = 0;
          #               yOffset = 0;
          #             };
          #           };
          #         };
          #         trayWidgets = {
          #           enabled = false;
          #           blurBehind = false;
          #           backgroundColor = {
          #             enabled = false;
          #             lightnessValue = 0.5;
          #             saturationValue = 0.5;
          #             alpha = 1;
          #             systemColor = "backgroundColor";
          #             systemColorSet = "View";
          #             custom = "#013efF";
          #             list = [
          #               "#ED8796"
          #               "#A6DA95"
          #               "#EED49F"
          #               "#8AADF4"
          #               "#F5BDE6"
          #               "#8BD5C4"
          #               "#f5a97f"
          #             ];
          #             followColor = 0;
          #             saturationEnabled = false;
          #             lightnessEnabled = false;
          #             animation = {
          #               enabled = false;
          #               interval = 3000;
          #               smoothing = 800;
          #             };
          #             sourceType = 1;
          #           };
          #           foregroundColor = {
          #             enabled = false;
          #             lightnessValue = 0.5;
          #             saturationValue = 0.5;
          #             alpha = 1;
          #             systemColor = "highlightColor";
          #             systemColorSet = "View";
          #             custom = "#fc0000";
          #             list = [
          #               "#ED8796"
          #               "#A6DA95"
          #               "#EED49F"
          #               "#8AADF4"
          #               "#F5BDE6"
          #               "#8BD5C4"
          #               "#f5a97f"
          #             ];
          #             followColor = 0;
          #             saturationEnabled = false;
          #             lightnessEnabled = false;
          #             animation = {
          #               enabled = false;
          #               interval = 3000;
          #               smoothing = 800;
          #             };
          #             sourceType = 1;
          #           };
          #           radius = {
          #             enabled = false;
          #             corner = {
          #               topLeft = 5;
          #               topRight = 5;
          #               bottomRight = 5;
          #               bottomLeft = 5;
          #             };
          #           };
          #           margin = {
          #             enabled = false;
          #             side = {
          #               right = 0;
          #               left = 0;
          #               top = 0;
          #               bottom = 0;
          #             };
          #           };
          #           border = {
          #             enabled = false;
          #             customSides = false;
          #             custom = {
          #               widths = {
          #                 left = 0;
          #                 bottom = 3;
          #                 right = 0;
          #                 top = 0;
          #               };
          #               margin = {
          #                 enabled = false;
          #                 side = {
          #                   right = 0;
          #                   left = 0;
          #                   top = 0;
          #                   bottom = 0;
          #                 };
          #               };
          #               radius = {
          #                 enabled = false;
          #                 corner = {
          #                   topLeft = 5;
          #                   topRight = 5;
          #                   bottomRight = 5;
          #                   bottomLeft = 5;
          #                 };
          #               };
          #             };
          #             width = 0;
          #             color = {
          #               lightnessValue = 0.5;
          #               saturationValue = 0.5;
          #               alpha = 1;
          #               systemColor = "highlightColor";
          #               systemColorSet = "View";
          #               custom = "#ff6c06";
          #               list = [
          #                 "#ED8796"
          #                 "#A6DA95"
          #                 "#EED49F"
          #                 "#8AADF4"
          #                 "#F5BDE6"
          #                 "#8BD5C4"
          #                 "#f5a97f"
          #               ];
          #               followColor = 0;
          #               saturationEnabled = false;
          #               lightnessEnabled = false;
          #               animation = {
          #                 enabled = false;
          #                 interval = 3000;
          #                 smoothing = 800;
          #               };
          #               sourceType = 1;
          #               enabled = true;
          #             };
          #           };
          #           borderSecondary = {
          #             enabled = false;
          #             customSides = false;
          #             custom = {
          #               widths = {
          #                 left = 0;
          #                 bottom = 3;
          #                 right = 0;
          #                 top = 0;
          #               };
          #               margin = {
          #                 enabled = false;
          #                 side = {
          #                   right = 0;
          #                   left = 0;
          #                   top = 0;
          #                   bottom = 0;
          #                 };
          #               };
          #               radius = {
          #                 enabled = false;
          #                 corner = {
          #                   topLeft = 5;
          #                   topRight = 5;
          #                   bottomRight = 5;
          #                   bottomLeft = 5;
          #                 };
          #               };
          #             };
          #             width = 0;
          #             color = {
          #               lightnessValue = 0.5;
          #               saturationValue = 0.5;
          #               alpha = 1;
          #               systemColor = "highlightColor";
          #               systemColorSet = "View";
          #               custom = "#ff6c06";
          #               list = [
          #                 "#ED8796"
          #                 "#A6DA95"
          #                 "#EED49F"
          #                 "#8AADF4"
          #                 "#F5BDE6"
          #                 "#8BD5C4"
          #                 "#f5a97f"
          #               ];
          #               followColor = 0;
          #               saturationEnabled = false;
          #               lightnessEnabled = false;
          #               animation = {
          #                 enabled = false;
          #                 interval = 3000;
          #                 smoothing = 800;
          #               };
          #               sourceType = 1;
          #               enabled = true;
          #             };
          #           };
          #           shadow = {
          #             background = {
          #               enabled = false;
          #               color = {
          #                 lightnessValue = 0.5;
          #                 saturationValue = 0.5;
          #                 alpha = 1;
          #                 systemColor = "backgroundColor";
          #                 systemColorSet = "View";
          #                 custom = "#282828";
          #                 list = [
          #                   "#ED8796"
          #                   "#A6DA95"
          #                   "#EED49F"
          #                   "#8AADF4"
          #                   "#F5BDE6"
          #                   "#8BD5C4"
          #                   "#f5a97f"
          #                 ];
          #                 followColor = 0;
          #                 saturationEnabled = false;
          #                 lightnessEnabled = false;
          #                 animation = {
          #                   enabled = false;
          #                   interval = 3000;
          #                   smoothing = 800;
          #                 };
          #                 sourceType = 1;
          #                 enabled = true;
          #               };
          #               size = 5;
          #               xOffset = 0;
          #               yOffset = 0;
          #             };
          #             foreground = {
          #               enabled = false;
          #               color = {
          #                 lightnessValue = 0.5;
          #                 saturationValue = 0.5;
          #                 alpha = 1;
          #                 systemColor = "backgroundColor";
          #                 systemColorSet = "View";
          #                 custom = "#282828";
          #                 list = [
          #                   "#ED8796"
          #                   "#A6DA95"
          #                   "#EED49F"
          #                   "#8AADF4"
          #                   "#F5BDE6"
          #                   "#8BD5C4"
          #                   "#f5a97f"
          #                 ];
          #                 followColor = 0;
          #                 saturationEnabled = false;
          #                 lightnessEnabled = false;
          #                 animation = {
          #                   enabled = false;
          #                   interval = 3000;
          #                   smoothing = 800;
          #                 };
          #                 sourceType = 1;
          #                 enabled = true;
          #               };
          #               size = 5;
          #               xOffset = 0;
          #               yOffset = 0;
          #             };
          #           };
          #         };
          #         nativePanelBackground = {
          #           enabled = false;
          #           opacity = 1;
          #         };
          #         stockPanelSettings = {
          #           position = {
          #             enabled = false;
          #             value = "top";
          #           };
          #           alignment = {
          #             enabled = false;
          #             value = "center";
          #           };
          #           lengthMode = {
          #             enabled = false;
          #             value = "fill";
          #           };
          #           visibility = {
          #             enabled = false;
          #             value = "none";
          #           };
          #           opacity = {
          #             enabled = false;
          #             value = "adaptive";
          #           };
          #           floating = {
          #             enabled = false;
          #             value = false;
          #           };
          #           thickness = {
          #             enabled = false;
          #             value = 48;
          #           };
          #           visible = {
          #             enabled = false;
          #             value = true;
          #           };
          #         };
          #         configurationOverrides = {
          #           overrides = {};
          #           associations = [];
          #         };
          #         unifiedBackground = [];
          #       };
          #     };
          #   };
          # }

          {
            plasmaPanelColorizer = {
              #     general = {
              #       hideWidget = true;
              #     };

              #     widgetBackground = {
              #       enable = true;

              #       colors = {
              #         source = "customList";
              #         customColorList = ["${settings.accent}" "${settings.accent}" "${settings.accent}" "${settings.base}" "${settings.base}" "${settings.base}" "${settings.base}" "${settings.red}" "${settings.teal}" "${settings.base}" "${settings.accent}" "${settings.accent}" "${settings.accent}"];
              #       };

              #       shape = {
              #         opacity = 1;
              #         radius = 6;
              #         outline = {
              #           colorSource = "custom";
              #           customColor = "${settings.text}";
              #           opacity = 0.1;
              #           width = 2;
              #         };
              #       };
              #     };

              #     panelBackground = {
              #       originalBackground = {
              #         hide = true;
              #       };
              #     };

              #     layout = {
              #       enable = true;
              #       backgroundMargin = {
              #         spacing = 4;
              #         vertical = 0;
              #         horizontal = 2;
              #       };
              #     };
            };
          }
        ];
      }
    ];
  };
}
