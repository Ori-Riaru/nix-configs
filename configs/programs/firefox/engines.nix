{
  pkgs,
  settings,
  ...
}: {
  programs.firefox = {
    profiles.${settings.username}.search = {
      default = "ddg";
      force = true;
      engines = {
        "Nix" = {
          urls = [
            {
              template = "https://mynixos.com/search";
              params = [
                {
                  name = "q";
                  value = "{searchTerms}";
                }
              ];
            }
          ];

          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [
            "@np"
            "@packages"
            "@package"
            "@nix"
            "@nixos"
            "@program"
            "@app"
            "@home"
            "@homemanager"
            "np;"
            "packages;"
            "package;"
            "nix;"
            "nixos;"
            "program;"
            "app;"
            "home;"
            "homemanager;"
          ];
        };

        "NixosWiki" = {
          urls = [
            {
              template = "https://nixos.wiki/index.php";
              params = [
                {
                  name = "search";
                  value = "{searchTerms}";
                }
              ];
            }
          ];

          icon = "https://nixos.wiki/favicon.ico";
          updateInterval = 24 * 60 * 60 * 1000;
          definedAliases = [
            "@nixwiki"
            "@nixoswiki"
            "@nw"
            "nixoswiki;"
            "nixwiki;"
            "nw;"
          ];
        };

        "Youtube" = {
          urls = [
            {
              template = "https://www.youtube.com/results";
              params = [
                {
                  name = "search_query";
                  value = "{searchTerms}";
                }
              ];
            }
          ];

          icon = "https://www.youtube.com/s/desktop/28bb7000/img/favicon_48x48.png";
          updateInterval = 24 * 60 * 60 * 1000;
          definedAliases = [
            "@yt"
            "@youtube"
            "@video"
            "yt;"
            "youtube;"
            "video;"
          ];
        };

        "google" = {
          urls = [
            {
              template = "https://www.google.com/search";
              params = [
                {
                  name = "q";
                  value = "{searchTerms}";
                }
              ];
            }
          ];

          icon = "https://www.google.com/favicon.ico";
          updateInterval = 24 * 60 * 60 * 1000;
          definedAliases = [
            "@google"
            "@g"
            "g;"
            "google;"
          ];
        };

        "AlternativeTo" = {
          urls = [
            {
              template = "https://alternativeto.net/browse/search";
              params = [
                {
                  name = "q";
                  value = "{searchTerms}";
                }
              ];
            }
          ];

          icon = "https://alternativeto.net/favicon.ico";
          updateInterval = 24 * 60 * 60 * 1000;
          definedAliases = [
            "@at"
            "@alternative"
            "@alternativeto"
            "at;"
            "alternative;"
            "alternativeto;"
          ];
        };

        "reddit" = {
          urls = [
            {
              template = "https://www.reddit.com/search";
              params = [
                {
                  name = "type";
                  value = "link&c";
                }
                {
                  name = "q";
                  value = "{searchTerms}";
                }
              ];
            }
          ];

          icon = "https://reddit.com/favicon.ico";
          updateInterval = 24 * 60 * 60 * 1000;
          definedAliases = [
            "@r"
            "@reddit"
            "r;"
            "reddit;"
          ];
        };

        "Amazon" = {
          urls = [
            {
              template = "https://www.amazon.ca/s";
              params = [
                {
                  name = "k";
                  value = "{searchTerms}";
                }
              ];
            }
          ];

          icon = "https://www.amazon.ca/favicon.ico";
          updateInterval = 24 * 60 * 60 * 1000;
          definedAliases = [
            "@am"
            "@amazon"
            "am;"
            "amazon;"
          ];
        };

        "Lemmy" = {
          urls = [
            {
              template = "https://phtn.app/search";
              params = [
                {
                  name = "q";
                  value = "{searchTerms}";
                }
              ];
            }
          ];

          icon = "https://phtn.app/img/logo-background.svg";
          updateInterval = 24 * 60 * 60 * 1000;
          definedAliases = [
            "@l"
            "@lemmy"
            "l;"
            "lemmy;"
            "phtn;"
          ];
        };

        "Anilist" = {
          urls = [
            {
              template = "https://anilist.co/search/anime";
              params = [
                {
                  name = "search";
                  value = "{searchTerms}";
                }
              ];
            }
          ];

          icon = "https://anilist.co/favicon.ico";
          updateInterval = 24 * 60 * 60 * 1000;
          definedAliases = [
            "@al"
            "@anilist"
            "al;"
            "anilist;"
          ];
        };

        "miruro" = {
          urls = [
            {
              template = "https://www.miruro.to/favicon.ico?v=0.9.9.1";
              params = [
                {
                  name = "query";
                  value = "{searchTerms}";
                }
                {
                  name = "sort";
                  value = "POPULARITY_DESC";
                }
                {
                  name = "type";
                  value = "ANIME";
                }
              ];
            }
          ];

          icon = "https://www.miruro.to/icons/favicon-32x32.png";
          updateInterval = 24 * 60 * 60 * 1000;
          definedAliases = [
            "@anime"
            "@miru"
            "@miruro"
            "anime;"
            "miru;"
            "miruro;"
          ];
        };

        "Ovagames" = {
          urls = [
            {
              template = "https://www.ovagames.com";
              params = [
                {
                  name = "s";
                  value = "{searchTerms}";
                }
                {
                  name = "x";
                  value = "0";
                }
                {
                  name = "y";
                  value = "0";
                }
              ];
            }
          ];

          icon = "https://www.ovagames.com/wp-content/uploads/2020/01/OG-Gaming-web-logo.png";
          updateInterval = 24 * 60 * 60 * 1000;
          definedAliases = [
            "@ova"
            "@games"
            "@game"
            "@ovagames"
            "ova;"
            "games;"
            "game;"
            "ovagames;"
          ];
        };

        "csrinru" = {
          urls = [
            {
              template = "https://cs.rin.ru/forum/search.php";
              params = [
                {
                  name = "terms";
                  value = "any";
                }
                {
                  name = "author";
                  value = "";
                }
                {
                  name = "sc";
                  value = "1";
                }
                {
                  name = "sf";
                  value = "titleonly";
                }
                {
                  name = "sk";
                  value = "t";
                }
                {
                  name = "sd";
                  value = "d";
                }
                {
                  name = "sr";
                  value = "topics";
                }
                {
                  name = "st";
                  value = "0";
                }
                {
                  name = "ch";
                  value = "300";
                }
                {
                  name = "t";
                  value = "0";
                }
                {
                  name = "submit";
                  value = "Search";
                }
                {
                  name = "keywords";
                  value = "{searchTerms}";
                }
              ];
            }
          ];
          icon = "https://cs.rin.ru/favicon.ico";
          updateInterval = 24 * 60 * 60 * 1000;
          definedAliases = [
            "@cs"
            "@csrin"
            "@csrinru"
            "cs;"
            "csrin;"
            "csrinru;"
          ];
        };

        "online-fix" = {
          urls = [
            {
              template = "https://online-fix.me/index.php";
              params = [
                {
                  name = "do";
                  value = "search";
                }
                {
                  name = "subaction";
                  value = "search";
                }
                {
                  name = "story";
                  value = "{searchTerms}";
                }
              ];
            }
          ];

          icon = "https://online-fix.me/favicon.ico";
          updateInterval = 24 * 60 * 60 * 1000;
          definedAliases = [
            "@of"
            "@onlinefix"
            "of;"
            "onlinefix;"
          ];
        };

        "Steam" = {
          urls = [
            {
              template = "https://store.steampowered.com/search";
              params = [
                {
                  name = "term";
                  value = "{searchTerms}";
                }
              ];
            }
          ];

          icon = "https://store.steampowered.com/favicon.ico";
          updateInterval = 24 * 60 * 60 * 1000;
          definedAliases = [
            "@steam"
            "@s"
            "steam;"
            "s;"
          ];
        };

        "SteamDB" = {
          urls = [
            {
              template = "https://steamdb.info/search/?a=all&q=test";
              params = [
                {
                  name = "a";
                  value = "all";
                }
                {
                  name = "q";
                  value = "{searchTerms}";
                }
              ];
            }
          ];

          icon = "https://steamdb.info/favicon.ico";
          updateInterval = 24 * 60 * 60 * 1000;
          definedAliases = [
            "@steamdb"
            "@sdb"
            "steamdb;"
            "sdb;"
          ];
        };

        "github" = {
          urls = [
            {
              template = "https://github.com/search";
              params = [
                {
                  name = "type";
                  value = "repositories";
                }
                {
                  name = "q";
                  value = "{searchTerms}";
                }
              ];
            }
          ];

          icon = "https://github.com/favicon.ico";
          updateInterval = 24 * 60 * 60 * 1000;
          definedAliases = [
            "@gh"
            "@git"
            "@github"
            "git;"
            "gh;"
            "github;"
          ];
        };

        "newegg" = {
          urls = [
            {
              template = "https://www.newegg.ca/p/pl";
              params = [
                {
                  name = "d";
                  value = "{searchTerms}";
                }
              ];
            }
          ];

          icon = "https://newegg.com/favicon.ico";
          updateInterval = 24 * 60 * 60 * 1000;
          definedAliases = [
            "@new"
            "@egg"
            "@newegg"
            "new;"
            "egg;"
            "newegg;"
          ];
        };
        "chatgpt" = {
          urls = [
            {
              template = "https://www.chatgpt.com/";
              params = [
                {
                  name = "q";
                  value = "{searchTerms}";
                }
              ];
            }
          ];

          icon = "https://chatgpt.com/favicon.ico";
          updateInterval = 24 * 60 * 60 * 1000;
          definedAliases = [
            "@gpt"
            "@chat"
            "@chatgpt"
            "gpt;"
            "chat;"
            "chatgpt;"
          ];
        };
        "claude" = {
          urls = [
            {
              template = "https://claude.ai/new/";
              params = [
                {
                  name = "q";
                  value = "{searchTerms}";
                }
              ];
            }
          ];

          icon = "https://claude.ai/favicon.ico";
          updateInterval = 24 * 60 * 60 * 1000;
          definedAliases = [
            "@claude"
            "@cd"
            "cd;"
            "claude;"
          ];
        };

        "protondb" = {
          urls = [
            {
              template = "https://www.protondb.com/search";
              params = [
                {
                  name = "q";
                  value = "{searchTerms}";
                }
              ];
            }
          ];

          icon = "https://www.protondb.com/favicon.ico";
          updateInterval = 24 * 60 * 60 * 1000;
          definedAliases = [
            "@proton"
            "@protondb"
            "@pdb"
            "proton;"
            "protondb;"
            "pdb;"
          ];
        };
      };
    };
  };
}
