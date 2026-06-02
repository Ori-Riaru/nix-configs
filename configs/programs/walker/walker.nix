{
  pkgs,
  inputs,
  settings,
  config,
  ...
}: {
  imports = [
    inputs.walker.homeManagerModules.walker
    ./theme.nix
    # ./menus/
  ];

  home.file.".config/elephant/icons" = {
    source = ./icons;
    recursive = true;
  };

  home.packages = with pkgs; [
    wtype # for snippets
    jq # for chromium bookmark import
    sqlite # for firefox based bookmark import
    efibootmgr # for windows reboot menu
    (pkgs.writeShellScriptBin "boot-windows" ''
      WINDOWS_ENTRY=$(efibootmgr | grep -i "Windows Boot Manager" | cut -c5-8)
      sudo efibootmgr --bootnext $WINDOWS_ENTRY
      sudo reboot
    '')
  ];

  # MANUAL
  # rbw register
  # rbw login
  programs.rbw = {
    enable = true;
    settings = {
      email = settings.email;
      pinentry = pkgs.pinentry-gnome3;
      lock_timeout = 24 * 60 * 365;
    };
  };

  programs.walker = {
    enable = true;
    runAsService = true;

    config = {
      force_keyboard_focus = true;
      columns.symbols = 7;
      hide_return_action = true;
      providers = {
        max_results = 256;
        default = [
          "providerlist"
          "desktopapplications"
          "windows"
          "websearch"
          "calc"
          "snippets"
          "nirisessions"
          "menus:power"
          "menus:bookmarks"
          "menus:efi"
          "menus:smarthome"
          "menus:folders"
        ];
        prefixes = [
          {
            prefix = ";";
            provider = "websearch";
          }
          {
            prefix = "?";
            provider = "providerlist";
          }
          {
            prefix = "/";
            provider = "files";
          }
          {
            prefix = "=";
            provider = "calc";
          }
          {
            prefix = ":";
            provider = "clipboard";
          }
          {
            prefix = "$";
            provider = "windows";
          }
          {
            prefix = ".";
            provider = "symbols";
          }
          {
            prefix = ">";
            provider = "runner";
          }
          {
            prefix = "@";
            provider = "bitwarden";
          }
        ];
        clipboard.time_format = "relative";

        actions."menus:folders" = [
          {
            action = "open";
            label = "Open";
            bind = "Return";
          }
          {
            action = "open_terminal";
            label = "Open Terminal";
            bind = "shift Return";
          }
        ];
      };

      keybinds.quick_activate = [];
    };
  };

  programs.elephant = {
    enable = true;
    providers = [
      "desktopapplications"
      "runner"
      "symbols"
      "calc"
      "windows"
      "menus"
      "websearch"
      "clipboard"
      "windows"
      "unicode"
      "snippets"
      "providerlist"
      "symbols"
      "runner"
      "calc"
      "bluetooth"
      "desktopapplications"
      "files"
      "nirisessions"
      "niriactions"
      "bitwarden"
    ];

    provider = {
      "desktopapplications".settings = {
        launch_prefix = "systemd-run --user --scope";
      };

      "menus" = {
        toml."Bookmarks" = {
          name = "bookmarks";
          name_pretty = "Bookmarks";
          icon = "bookmarks-symbolic";
          entries = let
            focus-command = ''
              sleep 0.1 && \
              current_id="$(niri msg --json focused-window | jq -r '.id')" && \
              current_app="$(niri msg --json windows | jq -r --arg id "$current_id" '.[] | select(.id == ($id|tonumber)) | .app_id')" && \
              [ "$current_app" = "vivaldi-stable" ] || \
              niri msg action focus-window --id "$(
                niri msg --json windows \
                  | jq -r '.[] | select(.app_id == "vivaldi-stable") | .id' \
                  | head -n 1
              )"
            '';
          in [
            {
              text = "Youtube";
              icon = "youtube";
              keywords = ["youtube" "yt"];
              actions = {open = "xdg-open https://www.youtube.com/feed/subscriptions && ${focus-command}";};
            }
            {
              text = "Online Fix";
              icon = "online fix";
              keywords = ["online fix"];
              actions = {open = "xdg-open https://online-fix.me/ && ${focus-command}";};
            }
            {
              text = "Jellyfin";
              icon = "jellyfin";
              keywords = ["jellyfin"];
              actions = {open = "xdg-open https://riaru.undo.it/web && ${focus-command}";};
            }
            {
              text = "Github";
              icon = "github";
              keywords = ["gh" "github" "git"];
              actions = {open = "xdg-open https://github.com && ${focus-command}";};
            }
            {
              text = "Mastodon";
              icon = "/home/riaru/.config/elephant/icons/mastodon.svg";
              keywords = ["mastodon" "void" "my void"];
              actions = {open = "xdg-open https://my.v0id.nl && ${focus-command}";};
            }
            {
              text = "Void";
              icon = "/home/riaru/.config/elephant/icons/void.png";
              keywords = ["mastodon" "void" "my void"];
              actions = {open = "xdg-open https://my.v0id.nl && ${focus-command}";};
            }
            {
              text = "Lemmy";
              icon = "/home/riaru/.config/elephant/icons/lemmy.svg";
              keywords = ["lemmy" "phtn"];
              actions = {open = "xdg-open https://phtn.app/?type=Subscribed && ${focus-command}";};
            }
            {
              text = "Anilist";
              icon = "/home/riaru/.config/elephant/icons/anilist.svg";
              keywords = ["anilist" "list" "ani"];
              actions = {open = "xdg-open https://anilist.co/user/Riaru/animelist && ${focus-command}";};
            }
            {
              text = "Proton";
              icon = "/home/riaru/.config/elephant/icons/proton.svg";
              keywords = ["proton" "mail"];
              actions = {open = "xdg-open https://mail.proton.me/u/1/inbox && ${focus-command}";};
            }
            {
              text = "Claude";
              icon = "/home/riaru/.config/elephant/icons/claude.svg";
              keywords = ["claude" "ai"];
              actions = {open = "xdg-open https://claude.ai/new && ${focus-command}";};
            }
            {
              text = "ChatGPT";
              icon = "/home/riaru/.config/elephant/icons/chatgpt.svg";
              keywords = ["chatgpt" "ai"];
              actions = {open = "xdg-open https://chatgpt.com && ${focus-command}";};
            }
            {
              text = "Gemini";
              icon = "/home/riaru/.config/elephant/icons/gemini.svg";
              keywords = ["gemini" "ai"];
              actions = {open = "xdg-open https://gemini.google.com/app && ${focus-command}";};
            }
            {
              text = "Letterboxd";
              icon = "/home/riaru/.config/elephant/icons/letterboxd.svg";
              keywords = ["letterboxd" "movies" "movie"];
              actions = {open = "xdg-open https://letterboxd.com/riaru/films/by/entry-rating/ && ${focus-command}";};
            }
            {
              text = "Dashboard";
              icon = "x-office-calendar";
              keywords = ["dashboard" "school"];
              actions = {open = "xdg-open $(cat '${config.sops.secrets.dashboard_url.path}') && ${focus-command}";};
            }
            {
              text = "Google Docs";
              icon = "google-docs";
              keywords = ["docs"];
              actions = {open = "xdg-open https://docs.google.com/document/u/0/ && ${focus-command}";};
            }
            {
              text = "Google Slides";
              icon = "google-slides";
              actions = {open = "xdg-open https://docs.google.com/presentation/u/0/ && ${focus-command}";};
            }
            {
              text = "Google Drive";
              icon = "google-drive";
              keywords = ["cloud" "drive"];
              actions = {open = "xdg-open https://drive.google.com/drive/u/0/home && ${focus-command}";};
            }
            {
              text = "Word";
              icon = "ms-word";
              keywords = ["docs"];
              actions = {open = "xdg-open https://word.cloud.microsoft/ && ${focus-command}";};
            }
            {
              text = "Miruro";
              keywords = ["anime"];
              actions = {open = "xdg-open https://www.miruro.to/ && ${focus-command}";};
            }
            {
              text = "unicode";
              action = {open = "xdg-open 'https://charcuterie.elastiq.ch/#1F5C5' && ${focus-command}";};
            }
          ];
        };

        toml."power" = {
          name = "power";
          name_pretty = "Power";
          icon = "system-shutdown-symbolic";
          entries = [
            {
              text = "Shutdown";
              keywords = ["shutdown" "power off" "off"];
              icon = "system-shutdown-symbolic";
              actions = {shutdown = "systemctl poweroff";};
            }
            {
              text = "Restart";
              keywords = ["reboot"];
              icon = "system-reboot-symbolic";
              actions = {restart = "systemctl reboot";};
            }
            {
              text = "Suspend";
              keywords = ["suspend" "sleep"];
              icon = "system-suspend-symbolic";
              actions = {suspend = "loginctl lock-session; sleep 1; systemctl suspend";};
            }
            {
              text = "Hibernate";
              keywords = ["sleep"];
              icon = "drive-harddisk-symbolic";
              actions = {hibernate = "loginctl lock-session; sleep 1; systemctl Hibernate";};
            }
            {
              text = "Logout";
              keywords = ["logout"];
              icon = "system-log-out-symbolic";
              actions = {logout = "niri msg action quit || loginctl terminate-session \"$XDG_SESSION_ID\"";};
            }
            {
              text = "Lock";
              keywords = ["lock" "lockscreen"];
              icon = "system-lock-screen-symbolic";
              actions = {lock = "loginctl lock-session";};
            }
          ];
        };

        toml."efi" = {
          name = "efi";
          name_pretty = "EFI";
          icon = "󰋊";
          entries = [
            {
              text = "Boot Windows";
              keywords = ["reboot" "restart" "windows"];
              icon = "󰖳";
              actions = {"boot windows" = "boot-windows";};
            }
          ];
        };

        toml."smarthome" = {
          name = "smarthome";
          name_pretty = "Smart Home";
          icon = "";
          entries = [
            {
              text = "Toggle Lights";
              icon = "";
              actions = {"Toggle lights" = "kasa --host 192.168.1.67 --username 'ori-riaru@proton.me' --password $(cat ${config.sops.secrets.kasa_pass.path}) toggle";};
            }
          ];
        };

        toml."folders" = {
          name = "folders";
          name_pretty = "Folders";
          icon = "";
          entries = [
            {
              text = "Home";
              icon = "";
              actions = {
                "open" = "nautilus /mnt/nfs/riaru";
                "open_terminal" = "ghostty --working-directory='/mnt/nfs/riaru'";
              };
            }
            {
              text = "Home Local";
              icon = "";
              actions = {
                "open" = "nautilus ~/";
                "open_terminal" = "ghostty --working-directory='/home/riaru'";
              };
            }
            {
              text = "Bulk";
              icon = "";
              actions = {
                "open" = "nautilus /mnt/nfs/bulk";
                "open_terminal" = "ghostty --working-directory='/mnt/nfs/bulk'";
              };
            }
            {
              text = "Config";
              icon = "";
              actions = {
                "open" = "nautilus ~/.config";
                "open_terminal" = "ghostty --working-directory='/home/riaru/.config'";
              };
            }
            {
              text = "Nix Config";
              keywords = ["nix-config"];
              icon = "";
              actions = {
                "open" = "nautilus /mnt/nfs/riaru/Projects/nix-configs";
                "open_terminal" = "ghostty --working-directory='/mnt/nfs/riaru/Projects/nix-configs'";
              };
            }
            {
              text = "Projects";
              icon = "";
              actions = {
                "open" = "nautilus /mnt/nfs/riaru/Projects";
                "open_terminal" = "ghostty --working-directory='/mnt/nfs/riaru/Projects'";
              };
            }
            {
              text = "Captures";
              icon = "";
              actions = {
                "open" = "nautilus /mnt/nfs/riaru/Captures";
                "open_terminal" = "ghostty --working-directory='/mnt/nfs/riaru/Captures'";
              };
            }
            {
              text = "Documents";
              icon = "󰈙";
              actions = {
                "open" = "nautilus /mnt/nfs/riaru/Documents";
                "open_terminal" = "ghostty --working-directory='/mnt/nfs/riaru/Documents'";
              };
            }
            {
              text = "Downloads";
              icon = "󰉍";
              actions = {
                "open" = "nautilus ~/Downloads";
                "open_terminal" = "ghostty --working-directory='/home/riaru/Downloads'";
              };
            }
            {
              text = "Games Local";
              icon = "";
              actions = {
                "open" = "nautilus ~/Games";
                "open_terminal" = "ghostty --working-directory='/home/riaru/Games'";
              };
            }
            {
              text = "Games Nas";
              icon = "";
              actions = {
                "open" = "nautilus /mnt/nfs/bulk/Games";
                "open_terminal" = "ghostty --working-directory='/mnt/nfs/bulk/Games'";
              };
            }
            {
              text = "Installs Local";
              icon = "󱊞";
              actions = {
                "open" = "nautilus ~/Games/Installs";
                "open_terminal" = "ghostty --working-directory='/home/riaru/Games/Installs'";
              };
            }
            {
              text = "Prefix Local";
              icon = "";
              actions = {
                "open" = "nautilus ~/Games/Prefixes";
                "open_terminal" = "ghostty --working-directory='/home/riaru/Games/Prefixes'";
              };
            }
            {
              text = "Installs NAS";
              icon = "󱊞";
              actions = {
                "open" = "nautilus /mnt/nfs/bulk/Games/Installs";
                "open_terminal" = "ghostty --working-directory='/mnt/nfs/bulk/Games/Installs'";
              };
            }
            {
              text = "Prefix NAS";
              icon = "";
              actions = {
                "open" = "nautilus /mnt/nfs/riaru/Games/Prefixes";
                "open_terminal" = "ghostty --working-directory='/mnt/nfs/riaru/Games/Prefixes'";
              };
            }
            {
              text = "Archive";
              icon = "";
              actions = {
                "open" = "nautilus /mnt/nfs/riaru/Projects/z-archive";
                "open_terminal" = "ghostty --working-directory='/mnt/nfs/riaru/Projects/z-archive'";
              };
            }
            {
              text = "Backups";
              icon = "";
              actions = {
                "open" = "nautilus /mnt/nfs/bulk/Backups";
                "open_terminal" = "ghostty --working-directory='/mnt/nfs/bulk/Backups'";
              };
            }
            {
              text = "Movies";
              icon = "";
              actions = {
                "open" = "nautilus /mnt/nfs/bulk/Movies";
                "open_terminal" = "ghostty --working-directory='/mnt/nfs/bulk/Movies'";
              };
            }
            {
              text = "Books";
              icon = "";
              actions = {
                "open" = "nautilus /mnt/nfs/bulk/Books";
                "open_terminal" = "ghostty --working-directory='/mnt/nfs/bulk/Books'";
              };
            }
            {
              text = "Shows";
              icon = "";
              actions = {
                "open" = "nautilus /mnt/nfs/bulk/Shows";
                "open_terminal" = "ghostty --working-directory='/mnt/nfs/bulk/Shows'";
              };
            }
            {
              text = "Music";
              icon = "";
              actions = {
                "open" = "nautilus /mnt/nfs/riaru/Music";
                "open_terminal" = "ghostty --working-directory='/mnt/nfs/riaru/Music'";
              };
            }
          ];
        };

        lua.fonts = ''
          Name = "fonts"
          NamePretty = "Fonts"
          Icon = "font-select"
          HideFromProviderlist = false
          Cache = false
          function GetEntries()
              local entries = {}
              local seen_fonts = {}
              local preview_text =
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum."
              local handle = io.popen("fc-list : family | head -100")
              if handle then
                  for line in handle:lines() do
                      local font_name = line:match("^([^,]+)")
                      if font_name then
                          font_name = font_name:gsub("^%s*(.-)%s*$", "%1")
                          if not seen_fonts[font_name] then
                              seen_fonts[font_name] = true
                              local escaped_font = font_name:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;")
                              local preview_markup = "<span font_desc='"
                                  .. escaped_font
                                  .. " 22' weight='bold'>"
                                  .. font_name
                                  .. "</span>\n\n"
                                  .. "<span font_desc='"
                                  .. escaped_font
                                  .. " 15' weight='bold'>Standard Weight Text</span>\n"
                                  .. "<span font_desc='"
                                  .. escaped_font
                                  .. " 12'>"
                                  .. preview_text
                                  .. "</span>\n\n"
                                  .. "<span font_desc='"
                                  .. escaped_font
                                  .. " 15' weight='bold'>Bold Text</span>\n"
                                  .. "<span font_desc='"
                                  .. escaped_font
                                  .. " 12' weight='bold'>"
                                  .. preview_text
                                  .. "</span>\n\n"
                                  .. "<span font_desc='"
                                  .. escaped_font
                                  .. " 15' weight='bold'>Italic Text</span>\n"
                                  .. "<span font_desc='"
                                  .. escaped_font
                                  .. " 12' style='italic'>"
                                  .. preview_text
                                  .. "</span>"
                              table.insert(entries, {
                                  Text = font_name,
                                  Value = font_name,
                                  Preview = preview_markup,
                                  PreviewType = "pango",
                                  Actions = {
                                      copy = "echo '" .. font_name .. "' | wl-copy && notify-send 'Copied' '" .. font_name .. "'",
                                  },
                              })
                          end
                      end
                  end
                  handle:close()
              end
              if #entries == 0 then
                  table.insert(entries, {
                      Text = "No fonts found",
                      Value = "",
                  })
              end
              return entries
          end
        '';
      };

      "bitwarden".settings = {
        copy_command = "wl-copy --";
        clear_command = "";
      };

      "nirisessions".settings = {
        name_pretty = "Sessions";
        sessions = [
          {
            name = "Development";
            workspaces = [
              {
                windows = [
                  {
                    command = "niri msg action spawn -- nautilus --new-window /mnt/nfs/riaru/Projects";
                    app_id = "org.gnome.Nautilus";
                  }
                  {
                    command = "niri msg action spawn -- codium";
                    app_id = "codium";
                  }
                  {
                    command = "niri msg action spawn -- ghostty";
                    app_id = "com.mitchellh.ghostty";
                  }
                  {
                    command = "niri msg action spawn -- ghostty";
                    app_id = "com.mitchellh.ghostty";
                    after = [
                      "sleep 0.2 && niri msg action consume-or-expel-window-left"
                    ];
                  }
                ];
              }
            ];
          }
        ];
      };

      "clipboard".settings = {
        max_items = 1000;
        command = "wl-copy; wtype -M ctrl v -m ctrl";
      };

      "snippets".settings = let
        hexToRgb = hex: let
          clean = builtins.substring 1 (builtins.stringLength hex - 1) hex;
          r = fromTOML "x=0x${builtins.substring 0 2 clean}";
          g = fromTOML "x=0x${builtins.substring 2 2 clean}";
          b = fromTOML "x=0x${builtins.substring 4 2 clean}";
        in "${toString r.x},${toString g.x},${toString b.x}";
      in {
        command = "wl-copy %CONTENT%; wtype -M ctrl v -m ctrl";
        icon = "preferences-color-symbolic";
        snippets = [
          # login
          {
            keywords = ["proton" "email" settings.email];
            name = settings.email;
            content = settings.email;
          }
          {
            keywords = ["google" "gmail"];
            name = "ori.riaru@gmail.com";
            content = "ori.riaru@gmail.com";
          }
          # Hex Colors
          {
            keywords = ["accent"];
            name = "Accent Hex";
            content = settings.accent;
          }
          {
            keywords = ["secondary"];
            name = "Secondary Hex";
            content = settings.secondary;
          }
          {
            keywords = ["text"];
            name = "Text Hex";
            content = settings.text;
          }
          {
            keywords = ["subtext"];
            name = "Subtext Hex";
            content = settings.subtext;
          }
          {
            keywords = ["hidden"];
            name = "Hidden Text Hex";
            content = settings.hidden;
          }
          {
            keywords = ["base"];
            name = "Base Hex";
            content = settings.base;
          }
          {
            keywords = ["section"];
            name = "Section Hex";
            content = settings.section;
          }
          {
            keywords = ["card"];
            name = "Card Hex";
            content = settings.card;
          }
          {
            keywords = ["overlay"];
            name = "Overlay Hex";
            content = settings.overlay;
          }
          {
            keywords = ["red"];
            name = "Red Hex";
            content = settings.red;
          }
          {
            keywords = ["orange"];
            name = "Orange Hex";
            content = settings.orange;
          }
          {
            keywords = ["tertiary" "yellow"];
            name = "Yellow Hex";
            content = settings.yellow;
          }
          {
            keywords = ["green"];
            name = "Green Hex";
            content = settings.green;
          }
          {
            keywords = ["teal"];
            name = "Teal Hex";
            content = settings.teal;
          }
          {
            keywords = ["cyan"];
            name = "Cyan Hex";
            content = settings.cyan;
          }
          {
            keywords = ["secondary" "blue"];
            name = "Blue Hex";
            content = settings.blue;
          }
          {
            keywords = ["accent" "purple"];
            name = "Purple Hex";
            content = settings.purple;
          }
          {
            keywords = ["pink"];
            name = "Pink Hex";
            content = settings.pink;
          }
          {
            keywords = ["brown"];
            name = "Brown Hex";
            content = settings.brown;
          }
          {
            keywords = ["muted"];
            name = "Muted Hex";
            content = settings.muted;
          }
          {
            keywords = ["float"];
            name = "Float Hex";
            content = settings.float;
          }

          # Bright/Dim/Dark Hex Variants

          {
            keywords = ["accent" "bright"];
            name = "Accent Bright Hex";
            content = settings."accent-bright";
          }
          {
            keywords = ["accent" "dim"];
            name = "Accent Dim Hex";
            content = settings."accent-dim";
          }
          {
            keywords = ["accent" "dark"];
            name = "Accent Dark Hex";
            content = settings."accent-dark";
          }
          {
            keywords = ["secondary" "bright"];
            name = "Secondary Bright Hex";
            content = settings."secondary-bright";
          }
          {
            keywords = ["secondary" "dim"];
            name = "Secondary Dim Hex";
            content = settings."secondary-dim";
          }
          {
            keywords = ["secondary" "dark"];
            name = "Secondary Dark Hex";
            content = settings."secondary-dark";
          }
          {
            keywords = ["red" "bright"];
            name = "Red Bright Hex";
            content = settings."red-bright";
          }
          {
            keywords = ["red" "dim"];
            name = "Red Dim Hex";
            content = settings."red-dim";
          }
          {
            keywords = ["red" "dark"];
            name = "Red Dark Hex";
            content = settings."red-dark";
          }
          {
            keywords = ["orange" "bright"];
            name = "Orange Bright Hex";
            content = settings."orange-bright";
          }
          {
            keywords = ["orange" "dim"];
            name = "Orange Dim Hex";
            content = settings."orange-dim";
          }
          {
            keywords = ["orange" "dark"];
            name = "Orange Dark Hex";
            content = settings."orange-dark";
          }
          {
            keywords = ["yellow" "bright"];
            name = "Yellow Bright Hex";
            content = settings."yellow-bright";
          }
          {
            keywords = ["yellow" "dim"];
            name = "Yellow Dim Hex";
            content = settings."yellow-dim";
          }
          {
            keywords = ["yellow" "dark"];
            name = "Yellow Dark Hex";
            content = settings."yellow-dark";
          }
          {
            keywords = ["green" "bright"];
            name = "Green Bright Hex";
            content = settings."green-bright";
          }
          {
            keywords = ["green" "dim"];
            name = "Green Dim Hex";
            content = settings."green-dim";
          }
          {
            keywords = ["green" "dark"];
            name = "Green Dark Hex";
            content = settings."green-dark";
          }
          {
            keywords = ["teal" "bright"];
            name = "Teal Bright Hex";
            content = settings."teal-bright";
          }
          {
            keywords = ["teal" "dim"];
            name = "Teal Dim Hex";
            content = settings."teal-dim";
          }
          {
            keywords = ["teal" "dark"];
            name = "Teal Dark Hex";
            content = settings."teal-dark";
          }
          {
            keywords = ["cyan" "bright"];
            name = "Cyan Bright Hex";
            content = settings."cyan-bright";
          }
          {
            keywords = ["cyan" "dim"];
            name = "Cyan Dim Hex";
            content = settings."cyan-dim";
          }
          {
            keywords = ["cyan" "dark"];
            name = "Cyan Dark Hex";
            content = settings."cyan-dark";
          }
          {
            keywords = ["blue" "bright"];
            name = "Blue Bright Hex";
            content = settings."blue-bright";
          }
          {
            keywords = ["blue" "dim"];
            name = "Blue Dim Hex";
            content = settings."blue-dim";
          }
          {
            keywords = ["blue" "dark"];
            name = "Blue Dark Hex";
            content = settings."blue-dark";
          }
          {
            keywords = ["purple" "bright"];
            name = "Purple Bright Hex";
            content = settings."purple-bright";
          }
          {
            keywords = ["purple" "dim"];
            name = "Purple Dim Hex";
            content = settings."purple-dim";
          }
          {
            keywords = ["purple" "dark"];
            name = "Purple Dark Hex";
            content = settings."purple-dark";
          }
          {
            keywords = ["pink" "bright"];
            name = "Pink Bright Hex";
            content = settings."pink-bright";
          }
          {
            keywords = ["pink" "dim"];
            name = "Pink Dim Hex";
            content = settings."pink-dim";
          }
          {
            keywords = ["pink" "dark"];
            name = "Pink Dark Hex";
            content = settings."pink-dark";
          }
          {
            keywords = ["brown" "bright"];
            name = "Brown Bright Hex";
            content = settings."brown-bright";
          }
          {
            keywords = ["brown" "dim"];
            name = "Brown Dim Hex";
            content = settings."brown-dim";
          }
          {
            keywords = ["brown" "dark"];
            name = "Brown Dark Hex";
            content = settings."brown-dark";
          }

          # RGB Colors

          {
            keywords = ["accent" "hex"];
            name = "Accent RGB";
            content = hexToRgb settings.accent;
          }
          {
            keywords = ["secondary"];
            name = "Secondary RGB";
            content = hexToRgb settings.secondary;
          }
          {
            keywords = ["text"];
            name = "Text RGB";
            content = hexToRgb settings.text;
          }
          {
            keywords = ["subtext"];
            name = "Subtext RGB";
            content = hexToRgb settings.subtext;
          }
          {
            keywords = ["hidden"];
            name = "Hidden Text RGB";
            content = hexToRgb settings.hidden;
          }
          {
            keywords = ["base"];
            name = "Base RGB";
            content = hexToRgb settings.base;
          }
          {
            keywords = ["section"];
            name = "Section RGB";
            content = hexToRgb settings.section;
          }
          {
            keywords = ["card"];
            name = "Card RGB";
            content = hexToRgb settings.card;
          }
          {
            keywords = ["overlay"];
            name = "Overlay RGB";
            content = hexToRgb settings.overlay;
          }
          {
            keywords = ["red"];
            name = "Red RGB";
            content = hexToRgb settings.red;
          }
          {
            keywords = ["orange"];
            name = "Orange RGB";
            content = hexToRgb settings.orange;
          }
          {
            keywords = ["tertiary" "yellow"];
            name = "Yellow RGB";
            content = hexToRgb settings.yellow;
          }
          {
            keywords = ["green"];
            name = "Green RGB";
            content = hexToRgb settings.green;
          }
          {
            keywords = ["teal"];
            name = "Teal RGB";
            content = hexToRgb settings.teal;
          }
          {
            keywords = ["cyan"];
            name = "Cyan RGB";
            content = hexToRgb settings.cyan;
          }
          {
            keywords = ["secondary" "blue"];
            name = "Blue RGB";
            content = hexToRgb settings.blue;
          }
          {
            keywords = ["accent" "purple"];
            name = "Purple RGB";
            content = hexToRgb settings.purple;
          }
          {
            keywords = ["pink"];
            name = "Pink RGB";
            content = hexToRgb settings.pink;
          }
          {
            keywords = ["brown"];
            name = "Brown RGB";
            content = hexToRgb settings.brown;
          }
          {
            keywords = ["muted"];
            name = "Muted RGB";
            content = hexToRgb settings.muted;
          }
          {
            keywords = ["float"];
            name = "Float RGB";
            content = hexToRgb settings.float;
          }

          # Bright/Dim/Dark RGB Variants

          {
            keywords = ["accent" "bright"];
            name = "Accent Bright RGB";
            content = hexToRgb settings."accent-bright";
          }
          {
            keywords = ["accent" "dim"];
            name = "Accent Dim RGB";
            content = hexToRgb settings."accent-dim";
          }
          {
            keywords = ["accent" "dark"];
            name = "Accent Dark RGB";
            content = hexToRgb settings."accent-dark";
          }
          {
            keywords = ["secondary" "bright"];
            name = "Secondary Bright RGB";
            content = hexToRgb settings."secondary-bright";
          }
          {
            keywords = ["secondary" "dim"];
            name = "Secondary Dim RGB";
            content = hexToRgb settings."secondary-dim";
          }
          {
            keywords = ["secondary" "dark"];
            name = "Secondary Dark RGB";
            content = hexToRgb settings."secondary-dark";
          }
          {
            keywords = ["red" "bright"];
            name = "Red Bright RGB";
            content = hexToRgb settings."red-bright";
          }
          {
            keywords = ["red" "dim"];
            name = "Red Dim RGB";
            content = hexToRgb settings."red-dim";
          }
          {
            keywords = ["red" "dark"];
            name = "Red Dark RGB";
            content = hexToRgb settings."red-dark";
          }
          {
            keywords = ["orange" "bright"];
            name = "Orange Bright RGB";
            content = hexToRgb settings."orange-bright";
          }
          {
            keywords = ["orange" "dim"];
            name = "Orange Dim RGB";
            content = hexToRgb settings."orange-dim";
          }
          {
            keywords = ["orange" "dark"];
            name = "Orange Dark RGB";
            content = hexToRgb settings."orange-dark";
          }
          {
            keywords = ["yellow" "bright"];
            name = "Yellow Bright RGB";
            content = hexToRgb settings."yellow-bright";
          }
          {
            keywords = ["yellow" "dim"];
            name = "Yellow Dim RGB";
            content = hexToRgb settings."yellow-dim";
          }
          {
            keywords = ["yellow" "dark"];
            name = "Yellow Dark RGB";
            content = hexToRgb settings."yellow-dark";
          }
          {
            keywords = ["green" "bright"];
            name = "Green Bright RGB";
            content = hexToRgb settings."green-bright";
          }
          {
            keywords = ["green" "dim"];
            name = "Green Dim RGB";
            content = hexToRgb settings."green-dim";
          }
          {
            keywords = ["green" "dark"];
            name = "Green Dark RGB";
            content = hexToRgb settings."green-dark";
          }
          {
            keywords = ["teal" "bright"];
            name = "Teal Bright RGB";
            content = hexToRgb settings."teal-bright";
          }
          {
            keywords = ["teal" "dim"];
            name = "Teal Dim RGB";
            content = hexToRgb settings."teal-dim";
          }
          {
            keywords = ["teal" "dark"];
            name = "Teal Dark RGB";
            content = hexToRgb settings."teal-dark";
          }
          {
            keywords = ["cyan" "bright"];
            name = "Cyan Bright RGB";
            content = hexToRgb settings."cyan-bright";
          }
          {
            keywords = ["cyan" "dim"];
            name = "Cyan Dim RGB";
            content = hexToRgb settings."cyan-dim";
          }
          {
            keywords = ["cyan" "dark"];
            name = "Cyan Dark RGB";
            content = hexToRgb settings."cyan-dark";
          }
          {
            keywords = ["blue" "bright"];
            name = "Blue Bright RGB";
            content = hexToRgb settings."blue-bright";
          }
          {
            keywords = ["blue" "dim"];
            name = "Blue Dim RGB";
            content = hexToRgb settings."blue-dim";
          }
          {
            keywords = ["blue" "dark"];
            name = "Blue Dark RGB";
            content = hexToRgb settings."blue-dark";
          }
          {
            keywords = ["purple" "bright"];
            name = "Purple Bright RGB";
            content = hexToRgb settings."purple-bright";
          }
          {
            keywords = ["purple" "dim"];
            name = "Purple Dim RGB";
            content = hexToRgb settings."purple-dim";
          }
          {
            keywords = ["purple" "dark"];
            name = "Purple Dark RGB";
            content = hexToRgb settings."purple-dark";
          }
          {
            keywords = ["pink" "bright"];
            name = "Pink Bright RGB";
            content = hexToRgb settings."pink-bright";
          }
          {
            keywords = ["pink" "dim"];
            name = "Pink Dim RGB";
            content = hexToRgb settings."pink-dim";
          }
          {
            keywords = ["pink" "dark"];
            name = "Pink Dark RGB";
            content = hexToRgb settings."pink-dark";
          }
          {
            keywords = ["brown" "bright"];
            name = "Brown Bright RGB";
            content = hexToRgb settings."brown-bright";
          }
          {
            keywords = ["brown" "dim"];
            name = "Brown Dim RGB";
            content = hexToRgb settings."brown-dim";
          }
          {
            keywords = ["brown" "dark"];
            name = "Brown Dark RGB";
            content = hexToRgb settings."brown-dark";
          }

          # Misc

          {
            keywords = ["font" settings.font];
            name = "Font";
            content = "${settings.font}";
          }
          {
            keywords = [
              "monospace"
              "fontMonospace"
              "font"
              settings.fontMonospace
            ];
            name = "Monospace Font";
            content = "${settings.fontMonospace}";
          }
          {
            keywords = ["gap"];
            name = "Gap Size";
            content = "4px";
          }
          {
            keywords = ["radius"];
            name = "Border Radius";
            content = "6px";
          }
          {
            keywords = ["equal" "divider"];
            name = "Equal Divider";
            content = "========================================";
          }
          {
            keywords = ["dash" "divider"];
            name = "Dash Divider";
            content = "\----------------------------------------";
          }
        ];
      };

      "calc".settings = {
        async = true;
      };

      "websearch".settings = {
        text_prefix = "";
        engine_finder_prefix = "e;";
        engine_finder_default_single = false;
        browser_profile_path = "/home/riaru/.mozilla/firefox/riaru";

        entries = [
          {
            default = true;
            default_single = true;
            name = "DuckDuckGo";
            icon = "duckduckgo";
            prefix = "d;";
            url = "https://duckduckgo.com/?q=%TERM%";
            suggestions_url = "https://ac.duckduckgo.com/ac/?q=%TERM%";
            suggestions_path = "#.phrase";
          }
          {
            default = true;
            name = "Google";
            icon = "google";
            prefix = "g;";
            url = "https://www.google.com/search?q=%TERM%";
            suggestions_url = "https://suggestqueries.google.com/complete/search?client=firefox&q=%TERM%";
            suggestions_path = "1";
          }
          {
            name = "Nix Options";
            icon = "nix-snowflake";
            prefix = "nix;";
            url = "https://mynixos.com/search?q=%TERM%";
          }
          {
            name = "Nixos Wiki";
            icon = "nix-snowflake";
            prefix = "nix;";
            url = "https://wiki.nixos.org/w/index.php?search=%TERM%";
            suggestions_url = "https://wiki.nixos.org/w/rest.php/v1/search/title?q=%TERM%&limit=10";
            suggestions_path = "1";
          }
          {
            name = "Nixpkgs";
            icon = "nix-snowflake";
            prefix = "ngh;";
            url = "https://github.com/NixOS/nixpkgs/issues?q=is%3Aissue%20state%3Aopen%20%TERM%";
          }
          {
            name = "Nixpkgs";
            icon = "nix-snowflake";
            prefix = "ngl;";
            url = "https://noogle.dev/q/?term=%TERM%";
          }
          {
            name = "Youtube";
            icon = "youtube";
            prefix = "yt;";
            url = "https://www.youtube.com/results?search_query=%TERM%";
            suggestions_url = "http://suggestqueries.google.com/complete/search?client=firefox&ds=yt&q=%TERM%";
            suggestions_path = "1";
          }
          {
            name = "Alternative To";
            icon = "/home/riaru/.config/elephant/icons/alternative-to.svg";
            prefix = "at;";
            url = "https://alternativeto.net/browse/search?q=%TERM%";
          }
          {
            name = "Reddit";
            icon = "reddit";
            prefix = "r;";
            url = "https://www.reddit.com/search?type=link&c=&q=%TERM%";
          }
          {
            name = "Amazon";
            icon = "amazon";
            prefix = "am;";
            url = "https://www.amazon.ca/s?k=%TERM%";
          }
          {
            name = "Lemmy";
            prefix = "l;";
            url = "https://phtn.app/search?q=%TERM%";
          }
          {
            name = "Anilist";
            icon = "/home/riaru/.config/elephant/icons/anilist.svg";
            prefix = "al;";
            url = "https://anilist.co/search/anime?search=%TERM%";
            suggestions_url = "https://myanimelist.net/search/prefix.json?type=all&keyword=%TERM%&v=1";
            suggestions_path = "categories.#(type==\"anime\").items.#.name";
          }
          {
            name = "Miruro";
            prefix = "anime;";
            url = "https://www.miruro.to/search?query=%TERM%&sort=POPULARITY_DESC&type=ANIME";
            suggestions_url = "https://myanimelist.net/search/prefix.json?type=all&keyword=%TERM%&v=1";
            suggestions_path = "categories.#(type==\"anime\").items.#.name";
          }
          {
            name = "Ovagames";
            prefix = "ova;";
            url = "https://www.ovagames.com?s=%TERM%&x=0&y=0";
          }
          {
            name = "csrinru";
            prefix = "cs;";
            url = "https://cs.rin.ru/forum/search.php?terms=any&author=&sc=1&sf=titleonly&sk=t&sd=d&sr=topics&st=0&ch=300&t=0&submit=Search&keywords=%TERM%";
          }
          {
            name = "Online Fix";
            prefix = "of;";
            url = "https://online-fix.me/index.php?do=search&subaction=search&story=%TERM%";
          }
          {
            name = "Steam";
            icon = "steam";
            prefix = "steam;";
            url = "https://store.steampowered.com/search?term=%TERM%";
          }
          {
            name = "SteamDB";
            prefix = "steamdb;";
            url = "https://steamdb.info/search/?a=all&q=%TERM%";
          }
          {
            name = "Github Code";
            icon = "github";
            prefix = "gh;";
            url = "https://github.com/search?type=code&q=%TERM%";
          }
          {
            name = "Github Repo";
            icon = "github";
            prefix = "gh;";
            url = "https://github.com/search?type=repositories&q=%TERM%";
          }
          {
            name = "Github Repo";
            icon = "github";
            prefix = "repo;";
            url = "https://github.com/search?type=repositories&q=%TERM%";
          }
          {
            name = "Github Code";
            icon = "github";
            prefix = "code;";
            url = "https://github.com/search?type=repositories&q=%TERM%";
          }
          {
            name = "Newegg";
            prefix = "shop;";
            url = "https://www.newegg.ca/p/pl?d=%TERM%";
            suggestions_url = "https://www.newegg.ca/api/SearchKeyword?CountryCode=CAN&keyword=%TERM%&nodeId=-1&from=www.newegg.ca";
            suggestions_path = "suggestion.keywords.#.keyword";
          }
          {
            name = "ChatGPT";
            icon = "/home/riaru/.config/elephant/icons/chatgpt.svg";
            prefix = "gpt;";
            url = "https://www.chatgpt.com/?q=%TERM%";
          }
          {
            name = "Claude";
            icon = "/home/riaru/.config/elephant/icons/claude.svg";
            prefix = "claude;";
            url = "https://claude.ai/new/?q=%TERM%";
          }
          {
            name = "ProtonDB";
            icon = "/home/riaru/.config/elephant/icons/protondb.svg";
            prefix = "proton;";
            url = "https://www.protondb.com/search?q=%TERM%";
          }
          {
            name = "Spotify";
            icon = "spotify";
            prefix = "spot;";
            url = "https://open.spotify.com/search/%TERM%";
          }
          {
            name = "Letterboxd";
            icon = "/home/riaru/.config/elephant/icons/letterboxd.svg";
            prefix = "lb;";
            url = "https://letterboxd.com/search/%TERM%";
          }
          {
            name = "Logo";
            icon = "/home/riaru/.config/elephant/icons/icons.svg";
            prefix = "logo;";
            url = "https://logosear.ch/?q=%TERM%";
          }
          {
            name = "Font Awesome";
            icon = "/home/riaru/.config/elephant/icons/font-awesome.svg";
            prefix = "icon;";
            url = "https://fontawesome.com/search?q=%TERM%&ic=free-collection";
          }
          {
            name = "Pinterest";
            icon = "/home/riaru/.config/elephant/icons/pinterest.svg";
            prefix = "pin;";
            url = "https://ca.pinterest.com/search/pins/?q=%TERM%";
          }
        ];
      };

      "files".settings = {
        search_dirs = [settings.nasPath "/mnt/nfs/bulk/"];
        fd_flags = [
          "--ignore-vcs"
          "-L"
          "--type"
          "file"
          "--type"
          "directory"
          "--exclude"
          "**/.Trash-1000"
          "--exclude"
          "**/z-Bulk"
          "--exclude"
          "**/z-Local"
          "--exclude"
          "**/Backups"
          "--exclude"
          "**/Games/Prefixes/*/*"
          "--exclude"
          "**/Games/Installs/*/*"
          "--exclude"
          "**/node_modules"
          "--exclude"
          "**/data/"
          "--exclude"
          "**/blendcache*"
          "--exclude"
          "**/PaperServer"
          "--exclude"
          "**/Managed"
          "--exclude"
          "**/Logs"
          "--exclude"
          "**/Thry"
          "--exclude"
          "**/target"
          "--exclude"
          "**/__pycache__"
          "--exclude"
          "*.mca"
          "--exclude"
          "*.class"
          "--exclude"
          "*.o"
          "--exclude"
          "**/Library"
          "--exclude"
          "**/Packages"
          "--exclude"
          "**/Assets"
          "--exclude"
          "**/ProjectSettings"
        ];
      };
    };
  };

  nix = {
    package = pkgs.nix;
    settings = {
      extra-substituters = [
        "https://walker.cachix.org"
        "https://walker-git.cachix.org"
      ];
      extra-trusted-public-keys = [
        "walker.cachix.org-1:fG8q+uAaMqhsMxWjwvk0IMb4mFPFLqHjuvfwQxE4oJM="
        "walker-git.cachix.org-1:vmC0ocfPWh0S/vRAQGtChuiZBTAe4wiKDeyyXM0/7pM="
      ];
    };
  };
}
