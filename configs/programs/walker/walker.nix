{
  pkgs,
  inputs,
  settings,
  config,
  lib,
  ...
}: {
  imports = [
    inputs.walker.homeManagerModules.walker
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

  programs.walker = {
    enable = true;
    runAsService = true;

    config = {
      theme = "Neutral Dark";

      force_keyboard_focus = true;
      providers.default = [
        "providerlist"
        "desktopapplications"
        "windows"
        "websearch"
        "calc"
        "files"
        "snippets"
        "nirisessions"
        "menus:power"
        "menus:bookmarks"
        "menus:efi"
      ];

      keybinds.quick_activate = [];
    };

    elephant = {
      providers = [
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
      ];

      provider = {
        "menus" = {
          toml = {
            "Bookmarks" = {
              name = "bookmarks";
              name_pretty = "Bookmarks";
              icon = "bookmarks-symbolic";
              entries = let
                focus-command = "sleep 0.1 && niri msg action focus-window --id \"$(niri msg --json windows | jq -r '.[] | select(.app_id == \"firefox\") | .id' | head -n 1)\"";
              in [
                {
                  text = "Youtube";
                  icon = "youtube";
                  keywords = ["youtube"];
                  actions = {open = "xdg-open https://www.youtube.com/feed/subscriptions && ${focus-command}";};
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
                  keywords = ["github" "git"];
                  actions = {open = "xdg-open https://github.com && ${focus-command}";};
                }
                {
                  text = "Mastodon";
                  icon = "/home/riaru/.config/elephant/icons/mastodon.svg";
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
                  actions = {open = "xdg-open https://letterboxd.com/Riaru/films/ && ${focus-command}";};
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
              ];
            };

            "power" = {
              name = "power";
              name_pretty = "Power";
              icon = "system-shutdown-symbolic";
              entries = [
                {
                  text = "Shutdown";
                  keywords = ["shutdown" "power off" "off"];
                  icon = "system-shutdown-symbolic";
                  actions = {shutdown = "systemctl shutdown";};
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

            "efi" = {
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
          };

          lua = {
            fonts = ''
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
        };

        "nirisessions" = {
          settings = {
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
        };

        "snippets".settings = let
          hexToRgb = hex: let
            clean = builtins.substring 1 (builtins.stringLength hex - 1) hex;
            r = builtins.fromTOML "x=0x${builtins.substring 0 2 clean}";
            g = builtins.fromTOML "x=0x${builtins.substring 2 2 clean}";
            b = builtins.fromTOML "x=0x${builtins.substring 4 2 clean}";
          in "${toString r.x},${toString g.x},${toString b.x}";
        in {
          command = "wl-copy %CONTENT%; wtype -M ctrl v -m ctrl";
          icon = "preferences-color-symbolic";
          snippets = [
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
              keywords = ["tertiary"];
              name = "Tertiary Hex";
              content = settings.tertiary;
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
              keywords = ["white"];
              name = "White Hex";
              content = settings.white;
            }
            {
              keywords = ["grey"];
              name = "Grey Hex";
              content = settings.grey;
            }
            {
              keywords = ["black"];
              name = "Black Hex";
              content = settings.black;
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
              keywords = ["tertiary"];
              name = "Tertiary RGB";
              content = hexToRgb settings.tertiary;
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
              keywords = ["white"];
              name = "White RGB";
              content = hexToRgb settings.white;
            }
            {
              keywords = ["grey"];
              name = "Grey RGB";
              content = hexToRgb settings.grey;
            }
            {
              keywords = ["black"];
              name = "Black RGB";
              content = hexToRgb settings.black;
            }

            # Misc

            {
              keywords = ["font" "inter"];
              name = "Inter";
              content = "Inter";
            }
            {
              keywords = ["monospace" "fontMonospace" "font"];
              name = "Monospace Font";
              content = "JetBrainsMono Nerd Font";
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
          ];
        };

        "websearch".settings = {
          entries = [
            {
              name = "DuckDuckGo";
              icon = "duckduckgo";
              prefix = "d;";
              url = "https://duckduckgo.com/?q=%TERM%";
            }
            {
              name = "Nix Options Search";
              icon = "nix-snowflake";
              prefix = "nix;";
              url = "https://mynixos.com/search?q=%TERM%";
            }
            {
              name = "Nixos Wiki";
              icon = "nix-snowflake";
              prefix = "nw;";
              url = "https://wiki.nixos.org/w/index.php?search=%TERM%";
            }
            {
              name = "Youtube";
              icon = "youtube";
              prefix = "yt;";
              url = "https://www.youtube.com/results?search_query=%TERM%";
            }
            {
              name = "Google";
              icon = "google";
              prefix = "g;";
              url = "https://www.google.com/search?q=%TERM%";
            }
            {
              name = "Alternative To";
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
            }
            {
              name = "Miruro";
              prefix = "anime;";
              url = "https://www.miruro.to/search?query=%TERM%&sort=POPULARITY_DESC&type=ANIME";
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
              name = "Github";
              icon = "github";
              prefix = "gh;";
              url = "https://github.com/search?type=repositories&q=%TERM%";
            }
            {
              name = "Newegg";
              prefix = "new;";
              url = "https://www.newegg.ca/p/pl?d=%TERM%";
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
          ];
        };

        "files".settings = {
          search_dirs = ["/mnt/nfs/riaru/" "/mnt/nfs/bulk/"];
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

    themes."Neutral Dark" = {
      style = ''
        @define-color window_bg_color ${settings.card};
        @define-color accent_bg_color ${settings.accent};
        @define-color theme_fg_color ${settings.text};
        @define-color error_bg_color ${settings.red};
        @define-color error_fg_color ${settings.base};


        popover {
          background: lighter(@window_bg_color);
          border: 2px solid @accent_bg_color;
          border-radius: 6px;
          padding: 10px;
        }

        * {
          all: unset;
          font-family: Inter;
        }

        .normal-icons {
          -gtk-icon-size: 16px;
        }

        .large-icons {
          -gtk-icon-size: 32px;
        }

        scrollbar {
          opacity: 0;
        }

        .box-wrapper {
          box-shadow:
            0 19px 38px rgba(0, 0, 0, 0.3),
            0 15px 12px rgba(0, 0, 0, 0.22);
          background: @window_bg_color;
          padding: 20px;
          border-radius: 8px;
          border: 2px solid @accent_bg_color;
        }

        .preview-box,
        .elephant-hint,
        .placeholder {
          color: @theme_fg_color;
        }

        .box {
        }

        .search-container {
          border-radius: 6px;
        }

        .input placeholder {
          opacity: 0.5;
        }

        .input selection {
          background: lighter(lighter(lighter(@window_bg_color)));
        }

        .input {
          caret-color: @theme_fg_color;
          background: lighter(@window_bg_color);
          padding: 10px;
          color: @theme_fg_color;
        }

        .input:focus,
        .input:active {
        }

        .content-container {
        }

        .placeholder {
        }

        .scroll {
        }

        .list {
          color: @theme_fg_color;
        }

        child {
        }

        .item-box {
          border-radius: 6px;
          padding: 10px;
        }

        .item-quick-activation {
          background: alpha(@accent_bg_color, 0.25);
          border-radius: 5px;
          padding: 10px;
        }

        /* child:hover .item-box, */
        child:selected .item-box {
          background: alpha(@accent_bg_color, 0.25);
        }

        .item-text-box {
        }

        .item-subtext {
          font-size: 12px;
          opacity: 0.5;
        }

        .providerlist .item-subtext {
          font-size: unset;
          opacity: 0.75;
        }

        .item-image-text {
          font-size: 28px;
        }

        .preview {
          border: 1px solid alpha(@accent_bg_color, 0.25);
          /* padding: 10px; */
          border-radius: 10px;
          color: @theme_fg_color;
        }

        .calc .item-text {
          font-size: 24px;
        }

        .calc .item-subtext {
        }

        .symbols .item-image {
          font-size: 24px;
        }

        .todo.done .item-text-box {
          opacity: 0.25;
        }

        .todo.urgent {
          font-size: 24px;
        }

        .todo.active {
          font-weight: bold;
        }

        .bluetooth.disconnected {
          opacity: 0.5;
        }

        .preview .large-icons {
          -gtk-icon-size: 64px;
        }

        .keybinds {
          padding-top: 10px;
          border-top: 1px solid lighter(@window_bg_color);
          font-size: 12px;
          color: @theme_fg_color;
        }

        .global-keybinds {
        }

        .item-keybinds {
        }

        .keybind {
        }

        .keybind-button {
          opacity: 0.5;
        }

        .keybind-button:hover {
          opacity: 0.75;
          cursor: pointer;
        }

        .keybind-bind {
          text-transform: lowercase;
          opacity: 0.35;
        }

        .keybind-label {
          padding: 2px 4px;
          border-radius: 4px;
          border: 1px solid @theme_fg_color;
        }

        .error {
          padding: 10px;
          background: @error_bg_color;
          color: @error_fg_color;
        }

        :not(.calc).current {
          font-style: italic;
        }

        .preview-content.archlinuxpkgs {
          font-family: monospace;
        }
      '';

      layouts = {
        layout = ''                  
          <?xml version="1.0" encoding="UTF-8"?>
          <interface>
            <requires lib="gtk" version="4.0"></requires>
            <object class="GtkWindow" id="Window">
              <style>
                <class name="window"></class>
              </style>
              <property name="resizable">true</property>
              <property name="title">Walker</property>
              <child>
                <object class="GtkBox" id="BoxWrapper">
                  <style>
                    <class name="box-wrapper"></class>
                  </style>
                  <property name="overflow">hidden</property>
                  <property name="orientation">horizontal</property>
                  <property name="valign">center</property>
                  <property name="halign">center</property>
                  <property name="width-request">800</property>
                  <property name="height-request">675</property>
                  <child>
                    <object class="GtkBox" id="Box">
                      <style>
                        <class name="box"></class>
                      </style>
                      <property name="orientation">vertical</property>
                      <property name="hexpand-set">true</property>
                      <property name="hexpand">true</property>
                      <property name="spacing">10</property>
                      <child>
                        <object class="GtkBox" id="SearchContainer">
                          <style>
                            <class name="search-container"></class>
                          </style>
                          <property name="overflow">hidden</property>
                          <property name="orientation">horizontal</property>
                          <property name="halign">fill</property>
                          <property name="hexpand-set">true</property>
                          <property name="hexpand">true</property>
                          <child>
                            <object class="GtkEntry" id="Input">
                              <style>
                                <class name="input"></class>
                              </style>
                              <property name="halign">fill</property>
                              <property name="hexpand-set">true</property>
                              <property name="hexpand">true</property>
                            </object>
                          </child>
                        </object>
                      </child>
                      <child>
                        <object class="GtkBox" id="ContentContainer">
                          <style>
                            <class name="content-container"></class>
                          </style>
                          <property name="orientation">horizontal</property>
                          <property name="spacing">10</property>
                          <child>
                            <object class="GtkLabel" id="ElephantHint">
                              <style>
                                <class name="elephant-hint"></class>
                              </style>
                              <property name="label">Waiting for elephant...</property>
                              <property name="hexpand">true</property>
                              <property name="vexpand">true</property>
                              <property name="visible">false</property>
                              <property name="valign">0.5</property>
                            </object>
                          </child>
                          <child>
                            <object class="GtkLabel" id="Placeholder">
                              <style>
                                <class name="placeholder"></class>
                              </style>
                              <property name="label">No Results</property>
                              <property name="hexpand">true</property>
                              <property name="vexpand">true</property>
                              <property name="valign">0.5</property>
                            </object>
                          </child>
                          <child>
                            <object class="GtkScrolledWindow" id="Scroll">
                              <style>
                                <class name="scroll"></class>
                              </style>
                              <property name="can_focus">false</property>
                              <property name="overlay-scrolling">true</property>
                              <property name="hexpand">true</property>
                              <property name="vexpand">true</property>
                              <property name="max-content-width">500</property>
                              <property name="min-content-width">500</property>
                              <property name="max-content-height">400</property>
                              <property name="propagate-natural-height">true</property>
                              <property name="propagate-natural-width">true</property>
                              <property name="hscrollbar-policy">automatic</property>
                              <property name="vscrollbar-policy">automatic</property>
                              <child>
                                <object class="GtkGridView" id="List">
                                  <style>
                                    <class name="list"></class>
                                  </style>
                                  <property name="max_columns">1</property>
                                  <property name="can_focus">false</property>
                                </object>
                              </child>
                            </object>
                          </child>
                          <child>
                            <object class="GtkBox" id="Preview">
                              <style>
                                <class name="preview"></class>
                              </style>
                            </object>
                          </child>
                        </object>
                      </child>
                      <child>
                        <object class="GtkBox" id="Keybinds">
                          <property name="hexpand">true</property>
                          <property name="margin-top">10</property>
                          <style>
                            <class name="keybinds"></class>
                          </style>
                          <child>
                            <object class="GtkBox" id="GlobalKeybinds">
                              <property name="spacing">10</property>
                              <style>
                                <class name="global-keybinds"></class>
                              </style>
                            </object>
                          </child>
                          <child>
                            <object class="GtkBox" id="ItemKeybinds">
                              <property name="hexpand">true</property>
                              <property name="halign">end</property>
                              <property name="spacing">10</property>
                              <style>
                                <class name="item-keybinds"></class>
                              </style>
                            </object>
                          </child>
                        </object>
                      </child>
                      <child>
                        <object class="GtkLabel" id="Error">
                          <style>
                            <class name="error"></class>
                          </style>
                          <property name="xalign">0</property>
                          <property name="visible">false</property>
                        </object>
                      </child>
                    </object>
                  </child>
                </object>
              </child>
            </object>
          </interface>'';
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
