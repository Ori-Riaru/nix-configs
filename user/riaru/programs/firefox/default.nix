{pkgs, ...}: {
  home.packages = with pkgs; [
    firefoxpwa
  ];

  programs.firefox = {
    enable = true;
    nativeMessagingHosts = [pkgs.firefoxpwa];
    profiles.riaru = {
      isDefault = true;

      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        darkreader
        bitwarden
        ublock-origin
        fastforwardteam
        disconnect
        tampermonkey
        darkreader
        stylus
        wayback-machine
        istilldontcareaboutcookies
        sponsorblock
        return-youtube-dislikes
        enhancer-for-youtube
        youtube-shorts-block
        dearrow
        reddit-enhancement-suite
        shinigami-eyes
        sidebery
        swift-selection-search
        buster-captcha-solver
        fastforwardteam
        user-agent-string-switcher
        userchrome-toggle
        windscribe
        augmented-steam

        # Infy scroll missing
        # automail missing
      ];

      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "browser.uiCustomization.state" = ''{"placements":{"widget-overflow-fixed-list":["developer-button","sync-button"],"unified-extensions-area":["newtaboverride_agenedia_com-browser-action","ublock0_raymondhill_net-browser-action","_3c078156-979c-498b-8990-85f7987dd929_-browser-action","sponsorblocker_ajay_app-browser-action","dearrow_ajay_app-browser-action","side-view_mozilla_org-browser-action","_84c8edb0-65ca-43a5-bc53-0e80f41486e1_-browser-action","addon_fastforward_team-browser-action","enhancerforyoutube_maximerf_addons_mozilla_org-browser-action","firefox_tampermonkey_net-browser-action","infy-scroll_webextensions-browser-action","plasma-browser-integration_kde_org-browser-action","_2e5ff8c8-32fe-46d0-9fc8-6b8986621f3c_-browser-action","_34daeb50-c2d2-4f14-886a-7160b24d66a4_-browser-action","_762f9885-5a13-4abd-9c77-433dcd38b8fd_-browser-action","_a6c4a591-f1b2-4f03-b3ff-767e5bedf4e7_-browser-action","_e58d3966-3d76-4cd9-8552-1582fbc800c1_-browser-action","2_0_disconnect_me-browser-action","wayback_machine_mozilla_org-browser-action","_b56933a8-6429-4ef4-88df-7f3b37f7e1fc_-browser-action","idcac-pub_guus_ninja-browser-action","firefoxpwa_filips_si-browser-action","_56b215f4-29b6-4898-bf2a-152d8bc189ed_-browser-action","_windscribeff-browser-action","user-agent-switcher_ninetailed_ninja-browser-action","_eb8f96ca-d31a-4f74-89ad-c25045497adb_-browser-action"],"nav-bar":["back-button","stop-reload-button","new-tab-button","forward-button","urlbar-container","unified-extensions-button"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["tabbrowser-tabs","alltabs-button","customizableui-special-spring17","_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action","_7a7a4a92-a2a0-41d1-9fd7-1e92480d612d_-browser-action","userchrome-toggle_joolee_nl-browser-action","addon_darkreader_org-browser-action","downloads-button"],"vertical-tabs":[],"PersonalToolbar":["personal-bookmarks"]},"seen":["save-to-pocket-button","side-view_mozilla_org-browser-action","userchrome-toggle_joolee_nl-browser-action","_84c8edb0-65ca-43a5-bc53-0e80f41486e1_-browser-action","addon_darkreader_org-browser-action","addon_fastforward_team-browser-action","enhancerforyoutube_maximerf_addons_mozilla_org-browser-action","firefox_tampermonkey_net-browser-action","infy-scroll_webextensions-browser-action","plasma-browser-integration_kde_org-browser-action","ublock0_raymondhill_net-browser-action","_2e5ff8c8-32fe-46d0-9fc8-6b8986621f3c_-browser-action","_34daeb50-c2d2-4f14-886a-7160b24d66a4_-browser-action","_3c078156-979c-498b-8990-85f7987dd929_-browser-action","_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action","_762f9885-5a13-4abd-9c77-433dcd38b8fd_-browser-action","_7a7a4a92-a2a0-41d1-9fd7-1e92480d612d_-browser-action","_a6c4a591-f1b2-4f03-b3ff-767e5bedf4e7_-browser-action","_e58d3966-3d76-4cd9-8552-1582fbc800c1_-browser-action","sponsorblocker_ajay_app-browser-action","dearrow_ajay_app-browser-action","developer-button","2_0_disconnect_me-browser-action","wayback_machine_mozilla_org-browser-action","_b56933a8-6429-4ef4-88df-7f3b37f7e1fc_-browser-action","idcac-pub_guus_ninja-browser-action","newtaboverride_agenedia_com-browser-action","firefoxpwa_filips_si-browser-action","_56b215f4-29b6-4898-bf2a-152d8bc189ed_-browser-action","_windscribeff-browser-action","user-agent-switcher_ninetailed_ninja-browser-action","_eb8f96ca-d31a-4f74-89ad-c25045497adb_-browser-action"],"dirtyAreaCache":["unified-extensions-area","nav-bar","TabsToolbar","toolbar-menubar","PersonalToolbar","widget-overflow-fixed-list","vertical-tabs"],"currentVersion":20,"newElementCount":18}'';
        "browser.aboutConfig.showWarning" = false;
        "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.toolbars.bookmarks.visibility" = "always";
      };

      search.engines = {
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
            "np:"
            "packages:"
            "package:"
            "nix:"
            "nixos:"
            "program:"
            "app:"
            "home:"
            "homemanager:"
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

          iconUpdateURL = "https://www.youtube.com/s/desktop/28bb7000/img/favicon_48x48.png";
          updateInterval = 7 * 24 * 60 * 60 * 1000;
          definedAliases = [
            "@yt"
            "@youtube"
            "@video"
            "yt:"
            "youtube:"
            "video:"
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

          iconUpdateURL = "https://alternativeto.net/favicon.ico";
          updateInterval = 7 * 24 * 60 * 60 * 1000;
          definedAliases = [
            "@at"
            "@alternative"
            "@alternativeto"
            "at:"
            "alternative:"
            "alternativeto:"
          ];
        };

        "Reddit" = {
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

          iconUpdateURL = "https://reddit.com/favicon.ico";
          updateInterval = 7 * 24 * 60 * 60 * 1000;
          definedAliases = [
            "@r"
            "@reddit"
            "r:"
            "reddit:"
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

          iconUpdateURL = "https://www.amazon.ca/favicon.ico";
          updateInterval = 7 * 24 * 60 * 60 * 1000;
          definedAliases = [
            "@am"
            "@amazon"
            "am:"
            "amazon:"
          ];
        };

        "Github" = {
          urls = [
            {
              template = "https://github.com/search";
              params = [
                {
                  name = "q";
                  value = "{searchTerms}";
                }
                {
                  type = "q";
                  value = "repositories";
                }
              ];
            }
          ];

          iconUpdateURL = "https://github.com/favicon.ico";
          updateInterval = 7 * 24 * 60 * 60 * 1000;
          definedAliases = [
            "@am"
            "@amazon"
            "am:"
            "amazon:"
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

          iconUpdateURL = "https://reddit.com/favicon.ico";
          updateInterval = 7 * 24 * 60 * 60 * 1000;
          definedAliases = [
            "@l"
            "@lemmy"
            "l:"
            "lemmy:"
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

          iconUpdateURL = "https://anilist.co/favicon.ico";
          updateInterval = 7 * 24 * 60 * 60 * 1000;
          definedAliases = [
            "@al"
            "@anilist"
            "al:"
            "anilist:"
          ];
        };

        "Aniwave" = {
          urls = [
            {
              template = "https://aniwave.to/filter";
              params = [
                {
                  name = "keyword";
                  value = "{searchTerms}";
                }
              ];
            }
          ];

          iconUpdateURL = "https://aniwave.to/assets/sites/aniwave/favicon1.png";
          updateInterval = 7 * 24 * 60 * 60 * 1000;
          definedAliases = [
            "@anime"
            "@ani"
            "@aniwave"
            "anime:"
            "ani:"
            "aniwave:"
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

          iconUpdateURL = "https://www.ovagames.com/wp-content/uploads/2020/01/OG-Gaming-web-logo.png";
          updateInterval = 7 * 24 * 60 * 60 * 1000;
          definedAliases = [
            "@ova"
            "@games"
            "@game"
            "@ovagames"
            "ova:"
            "games:"
            "game:"
            "ovagames:"
          ];
        };

        "csrinru" = {
          urls = [
            {
              template = "https://cs.rin.ru/forum/search.php";
              params = [
                {
                  name = "keywords";
                  value = "{searchTerms}";
                }
              ];
            }
          ];

          iconUpdateURL = "https://cs.rin.ru/favicon.ico";
          updateInterval = 7 * 24 * 60 * 60 * 1000;
          definedAliases = [
            "@cs"
            "@csrin"
            "@csrinru"
            "cs:"
            "csrin:"
            "csrinru:"
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

          iconUpdateURL = "https://online-fix.me/favicon.ico";
          updateInterval = 7 * 24 * 60 * 60 * 1000;
          definedAliases = [
            "@of"
            "@onlinefix"
            "of:"
            "onlinefix:"
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

          iconUpdateURL = "https://store.steampowered.com/favicon.ico";
          updateInterval = 7 * 24 * 60 * 60 * 1000;
          definedAliases = [
            "@steam"
            "@s"
            "steam:"
            "s:"
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

          iconUpdateURL = "https://github.com/favicon.ico";
          updateInterval = 7 * 24 * 60 * 60 * 1000;
          definedAliases = [
            "@git"
            "@github"
            "git:"
            "github:"
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

          iconUpdateURL = "https://github.com/favicon.ico";
          updateInterval = 7 * 24 * 60 * 60 * 1000;
          definedAliases = [
            "@git"
            "@github"
            "git:"
            "github:"
          ];
        };
      };

      userChrome = ''
                :root {
          --sidebar-width-collapsed: 36px;
          --sidebar-width-expanded: 250px;

          --bookmark-columns: 3;
        }

        @property --sidebar-width {
          syntax: "<length>";
          inherits: true;
          initial-value: 0px;
        }

        body {
          --sidebar-width: var(--sidebar-width-collapsed);
          transition: --sidebar-width 0.2s linear 0.5s;

          /* Expand sidebar on hover */
          &:has(> #navigator-toolbox:hover),
          &:has(> #browser > #sidebar-box:hover) {
            --sidebar-width: var(--sidebar-width-expanded);
            transition: --sidebar-width 0.15s ease-out 0.04s;
          }
        }

        /* Position tab window To the right of sidebar */
        #tabbrowser-tabbox {
          position: absolute !important;
          top: 0;
          left: var(--sidebar-width-collapsed);

          width: calc(100% - var(--sidebar-width-collapsed));
          height: 100%;
        }

        /* Permanant Expanded Sidebar Toggle */
        :root[titlepreface="᠎"] {
          body {
            --sidebar-width: var(--sidebar-width-expanded) !important;
          }

          #tabbrowser-tabbox {
            left: var(--sidebar-width);
            width: calc(100% - var(--sidebar-width));
          }
        }

        :root[inFullscreen] #tabbrowser-tabbox {
          left: 0;
          width: 100%;
        }

        /* Define Sidebar Layout*/

        #navigator-toolbox {
          display: grid;
          grid-template-areas:
            "nav spacer"
            "nav bookmark"
            "nav extension";
          grid-template-columns: var(--sidebar-width-collapsed) 1fr;
          grid-template-rows: var(--urlbar-min-height) 1fr auto;

          width: var(--sidebar-width);

          z-index: 3 !important;

          border: none !important;
        }

        #sidebar-box {
          min-width: 0 !important;
          width: var(--sidebar-width) !important;
          z-index: 2;
        }

        #sidebar-splitter,
        #sidebar-header {
          display: none;
        }

        #nav-bar {
          grid-area: nav;
          flex-direction: column;
          overflow: visible !important;
          background: transparent !important;
        }

        #nav-bar-customization-target {
          display: contents;
        }

        /* Urlbar */
        #urlbar-container {
          order: -1;
          width: var(--sidebar-width) !important;
        }

        #urlbar:not([breakout-extend="true"]) {
          #page-action-buttons,
          #identity-box,
          #tracking-protection-icon-container,
          #identity-icon-box,
          #picture-in-picture-button,
          #pageAction-urlbar-side-view_mozilla_org,
          #pageAction-urlbar-firefoxpwa_filips_si {
            display: none;
          }
        }

        /* Expand searchbar when active */
        #urlbar[breakout-extend="true"] {
          margin-top: 5px;
          margin-left: 10px;
          min-width: min(900px, calc(100vw - 10px)) !important;
        }

        /* Hide Unecessary url bar notifications */
        #nav-bar-customization-target > * {
          padding: 0 !important;
          margin: 0 !important;
        }

        /* Hide original tab elements */
        #tabbrowser-tabs,
        #alltabs-button,
        .titlebar-buttonbox-container,
        .titlebar-spacer {
          display: none !important;
        }

        /* Bookmark bar */
        #PersonalToolbar {
          grid-area: bookmark;
          padding: 0 !important;
          max-height: unset !important;
          background: transparent !important;
        }

        #PlacesToolbarItems {
          display: grid;
          grid-template-columns: repeat(var(--bookmark-columns), 1fr);
        }

        /* Hide bookmark label */
        .bookmark-item .toolbarbutton-text {
          display: none !important;
        }

        /* Extensions bar */
        #TabsToolbar {
          grid-area: extension;

          overflow: clip;
          min-width: 0;
        }

        #unified-extensions-button {
          order: 100;
        }

        /*           #userchrome-toggle_joolee_nl-BAP {
                    position: fixed !important;
                    bottom: 0;
                    left: 0;
                  } */

        /* Visuals */
        #PlacesToolbarItems {
          > .bookmark-item:nth-of-type(1) {
            background: grey !important;
          }

          > .bookmark-item:nth-of-type(2) {
            background: grey !important;
          }

          > .bookmark-item:nth-of-type(3) {
            background: grey !important;
          }

          > .bookmark-item:nth-of-type(4) {
            background: grey !important;
          }

          > .bookmark-item:nth-of-type(5) {
            background: grey !important;
          }

          > .bookmark-item:nth-of-type(6) {
            background: grey !important;
          }

          > .bookmark-item:nth-of-type(7) {
            background: grey !important;
          }

          > .bookmark-item:nth-of-type(8) {
            background: grey !important;
          }

          > .bookmark-item:nth-of-type(9) {
            background: grey !important;
          }
        }

      '';
      userContent = ''
      '';
    };
  };
}
