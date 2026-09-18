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
    ./theme.nix
    ./menus/bookmarks.nix
    ./menus/create.nix
    ./menus/efi.nix
    ./menus/folders.nix
    ./menus/fonts.nix
    ./menus/power.nix
    ./menus/projects.nix
    ./menus/rebuild.nix
    ./menus/smarthome.nix
    ./menus/system.nix
    ./menus/colors.nix
    ./menus/nix.nix
  ];

  home.file.".config/elephant/icons" = {
    source = ./icons;
    recursive = true;
  };

  home.packages = with pkgs; [
    wtype
    sqlite
    bitwarden-cli
  ];

  # MANUAL
  # rbw register
  # rbw login
  programs.rbw = {
    enable = true;
  };
  
  home.activation.rbwConfig = lib.hm.dag.entryAfter ["writeBoundary"] ''
    config="$HOME/.config/rbw/config.json"
    pinentry="${pkgs.pinentry-gnome3}/bin/pinentry"
    mkdir -p "$(dirname "$config")"
    if [ -L "$config" ] && echo "$(readlink -f "$config")" | grep -q '^/nix/store/'; then
      rm -f "$config"
    fi
    if [ ! -f "$config" ]; then
      printf '%s\n' \
        '{' \
        '  "email": "${settings.email}",' \
        '  "lock_timeout": 525600,' \
        '  "pinentry": ""' \
        '}' > "$config"
      chmod 600 "$config"
    fi
    sed -i "s#\"pinentry\": \".*\"#\"pinentry\": \"$pinentry\"#" "$config"
  '';

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
          "bluetooth"
          "menus:power"
          "menus:bookmarks"
          "menus:colors"
          "menus:layoutPrefs"
          "menus:efi"
          "menus:smarthome"
          "menus:folders"
          "menus:create"
          "menus:rebuild"
          "menus:projects"
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
          {
            prefix = "+";
            provider = "menus:create";
          }
          {
            prefix = "&";
            provider = "menus:add";
          }
        ];
        clipboard.time_format = "relative";
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
      "unicode"
      "snippets"
      "providerlist"
      "bluetooth"
      "files"
      "nirisessions"
      "niriactions"
      "bitwarden"
    ];

    settings.launch_prefix = "systemd-run --user --scope";

    provider = {
      "desktopapplications".settings = {
        launch_prefix = "systemd-run --user --scope";
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

      "snippets".settings = {
        command = "wl-copy %CONTENT%; wtype -M ctrl v -m ctrl";
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
          {
            keywords = ["equal" "divider"];
            name = "Equal Divider";
            content = "========================================";
          }
          {
            keywords = ["divider"];
            name = "Dash Divider";
            content = "\\----------------------------------------";
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
        browser_profile_path = "${config.xdg.configHome}/mozilla/firefox/${settings.username}";

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
            name = "Nixpkgs Issues";
            icon = "nix-snowflake";
            prefix = "ngh;";
            url = "https://github.com/NixOS/nixpkgs/issues?q=is%3Aissue%20state%3Aopen%20%TERM%";
          }
          {
            name = "Nixpkgs Search";
            icon = "nix-snowflake";
            prefix = "ngl;";
            url = "https://noogle.dev/q/?term=%TERM%";
          }
          {
            name = "Youtube";
            icon = "youtube";
            prefix = "yt;";
            url = "https://www.youtube.com/results?search_query=%TERM%";
            suggestions_url = "https://suggestqueries.google.com/complete/search?client=firefox&ds=yt&q=%TERM%";
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
            prefix = "repo;";
            url = "https://github.com/search?type=repositories&q=%TERM%";
          }
          {
            name = "Github Code";
            icon = "github";
            prefix = "code;";
            url = "https://github.com/search?type=code&q=%TERM%";
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
