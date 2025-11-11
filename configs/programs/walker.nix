{
  pkgs,
  inputs,
  settings,
  lib,
  ...
}: {
  imports = [
    inputs.walker.homeManagerModules.walker
  ];

  programs.walker = {
    enable = true;
    runAsService = true;

    config = {
      theme = "Neutral Dark";

      force_keyboard_focus = true;
      providers.default = [
        "desktopapplications"
        "windows"
        "calc"
        "websearch"
        "clipboard"
        "runner"
        "providerlist"
        "files"
        "menus:power"
      ];

      keybinds.quick_activate = [];
    };

    elephant = {
      provider = {
        "menus" = {
          toml = {
            "power" = {
              name = "power";
              name_pretty = "Power";
              icon = "system-shutdown-symbolic";
              entries = [
                {
                  text = "Shutdown";
                  keywords = ["shutdown" "power off" "off"];
                  icon = "system-shutdown-symbolic";
                  terminal = true;
                  actions = {shutdown = "sudo shutdown now";};
                }
                {
                  text = "Restart";
                  keywords = ["reboot"];
                  icon = "system-reboot-symbolic";
                  terminal = true;
                  actions = {restart = "sudo reboot now";};
                }
                {
                  text = "Suspend";
                  keywords = ["sleep"];
                  icon = "system-suspend-symbolic";
                  terminal = true;
                  actions = {suspend = "systemctl suspend";};
                }
                {
                  text = "Hibernate";
                  icon = "system-suspend-symbolic";
                  terminal = true;
                  actions = {suspend = "systemctl Hibernate";};
                }
              ];
            };
          };
        };

        "websearch".settings = {
          entries = [
            {
              default = true;
              name = "DuckDuckGo";
              prefix = "d;";
              url = "https://duckduckgo.com/?q=%TERM%";
            }
            {
              name = "Nix";
              prefix = "nix;";
              url = "https://mynixos.com/search?q=%TERM%";
            }
            {
              name = "NixosWiki";
              prefix = "nw;";
              url = "https://wiki.nixos.org/w/index.php?search=%TERM%";
            }
            {
              name = "Youtube";
              prefix = "yt;";
              url = "https://www.youtube.com/results?search_query=%TERM%";
            }
            {
              name = "Google";
              prefix = "g;";
              url = "https://www.google.com/search?q=%TERM%";
            }
            {
              name = "AlternativeTo";
              prefix = "at;";
              url = "https://alternativeto.net/browse/search?q=%TERM%";
            }
            {
              name = "Reddit";
              prefix = "r;";
              url = "https://www.reddit.com/search?type=link&c=&q=%TERM%";
            }
            {
              name = "Amazon";
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
              prefix = "gpt;";
              url = "https://www.chatgpt.com/?q=%TERM%";
            }
            {
              name = "Claude";
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
              prefix = "spot;";
              url = "https://open.spotify.com/search/%TERM%";
            }
            {
              name = "Letterboxd";
              prefix = "lb;";
              url = "https://letterboxd.com/search/%TERM%";
            }
          ];
        };

        "files".settings = {
          search_dirs = ["/mnt/nfs/riaru/" "/mnt/nfs/bulk"];
          fd_flags = lib.concatStringsSep " " [
            "--ignore-vcs"
            "-L"
            "--type file"
            "--type directory"
            "--exclude **/.Trash-1000"
            "--exclude **/z-Bulk"
            "--exclude **/z-Local"
            "--exclude **/Backups"
            "--exclude **/Games/Prefixes/*/*"
            "--exclude **/Games/Installs/*/*"
            "--exclude **/node_modules"
            "--exclude **/data/"
            "--exclude **/blendcache*"
            "--exclude **/PaperServer"
            "--exclude **/Managed"
            "--exclude **/Logs"
            "--exclude **/Thry"
            "--exclude **/target"
            "--exclude **/__pycache__"
            "--exclude *.mca"
            "--exclude *.class"
            "--exclude *.o"
            "--exclude **/Library"
            "--exclude **/Packages"
            "--exclude **/Assets"
            "--exclude **/ProjectSettings"
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
          margin-left: 10px;
          background: alpha(@accent_bg_color, 0.25);
          border-radius: 5px;
          padding: 10px;
        }

        child:hover .item-box,
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
          padding: 10px;
          border-radius: 6px;
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

        .keybinds-wrapper {
          border-top: 1px solid lighter(@window_bg_color);
          font-size: 12px;
          opacity: 0.5;
          color: @theme_fg_color;
        }

        .keybinds {
        }

        .keybind {
        }

        .keybind-bind {
          /* color: lighter(@window_bg_color); */
          font-weight: bold;
          text-transform: lowercase;
        }

        .keybind-label {
        }

        .error {
          padding: 10px;
          background: @error_bg_color;
          color: @error_fg_color;
        }

        :not(.calc).current {
          font-style: italic;
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
                  <property name="margin-bottom">75</property>
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
                        <object class="GtkBox" id="KeybindsWrapper">
                          <property name="hexpand">true</property>
                          <style>
                            <class name="keybinds-wrapper"></class>
                          </style>
                          <child>
                            <object class="GtkBox" id="GlobalKeybinds">
                              <property name="hexpand">true</property>
                              <property name="spacing">10</property>
                              <property name="margin-top">10</property>
                              <style>
                                <class name="global-keybinds"></class>
                              </style>
                            </object>
                          </child>
                          <child>
                            <object class="GtkBox" id="Keybinds">
                              <property name="hexpand">true</property>
                              <property name="halign">end</property>
                              <property name="spacing">10</property>
                              <property name="margin-top">10</property>
                              <style>
                                <class name="keybinds"></class>
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
