{
  pkgs,
  settings,
  ...
}: {
  imports = [
    ./engines.nix
  ];

  home.packages = with pkgs; [
    firefoxpwa
  ];

  programs.firefox = {
    enable = true;
    nativeMessagingHosts = [pkgs.firefoxpwa];
    profiles.${settings.username} = {
      isDefault = true;

      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        darkreader
        bitwarden
        ublock-origin
        fastforwardteam
        tampermonkey
        darkreader
        stylus
        wayback-machine
        istilldontcareaboutcookies
        sponsorblock
        return-youtube-dislikes
        reddit-enhancement-suite
        shinigami-eyes
        sidebery
        swift-selection-search
        buster-captcha-solver
        user-agent-string-switcher
        userchrome-toggle
        windscribe
        augmented-steam
        auto-tab-discard
        redirector
        pwas-for-firefox
        web-clipper-obsidian

        # Missing downloads
        # custom new page
        # enhancer-for-youtube
        # infy-scroll
        # automail
        # smart-prevent-duplicate-tabs
        # steamdb
      ];

      settings = {
        # enable userchrome
        "devtools.chrome.enabled" = true;
        "devtools.debugger.remote-enabled" = true;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

        # Disable ads
        "browser.aboutConfig.showWarning" = false;
        "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;

        # Privacy
        "extensions.formautofill.addresses.enabled" = false;
        "extensions.formautofill.creditCards.enabled" = false;
        "data.reporting.healthreport.uploadEnabled" = false;
        "privacy.admeasurement.enabled" = false;
        "browser.discovery.enabled" = false;

        # Picture in picture
        "media.videocontrols.picture-in-picture.enabled" = false;

        # layout
        "browser.toolbars.bookmarks.visibility" = "always";
        "browser.uiCustomization.state" = ''{"placements":{"widget-overflow-fixed-list":["developer-button","sync-button"],"unified-extensions-area":["newtaboverride_agenedia_com-browser-action","ublock0_raymondhill_net-browser-action","_3c078156-979c-498b-8990-85f7987dd929_-browser-action","sponsorblocker_ajay_app-browser-action","dearrow_ajay_app-browser-action","side-view_mozilla_org-browser-action","_84c8edb0-65ca-43a5-bc53-0e80f41486e1_-browser-action","addon_fastforward_team-browser-action","enhancerforyoutube_maximerf_addons_mozilla_org-browser-action","firefox_tampermonkey_net-browser-action","infy-scroll_webextensions-browser-action","plasma-browser-integration_kde_org-browser-action","_2e5ff8c8-32fe-46d0-9fc8-6b8986621f3c_-browser-action","_34daeb50-c2d2-4f14-886a-7160b24d66a4_-browser-action","_762f9885-5a13-4abd-9c77-433dcd38b8fd_-browser-action","_a6c4a591-f1b2-4f03-b3ff-767e5bedf4e7_-browser-action","_e58d3966-3d76-4cd9-8552-1582fbc800c1_-browser-action","2_0_disconnect_me-browser-action","wayback_machine_mozilla_org-browser-action","_b56933a8-6429-4ef4-88df-7f3b37f7e1fc_-browser-action","idcac-pub_guus_ninja-browser-action","firefoxpwa_filips_si-browser-action","_56b215f4-29b6-4898-bf2a-152d8bc189ed_-browser-action","_windscribeff-browser-action","user-agent-switcher_ninetailed_ninja-browser-action","_eb8f96ca-d31a-4f74-89ad-c25045497adb_-browser-action","_c2c003ee-bd69-42a2-b0e9-6f34222cb046_-browser-action"],"nav-bar":["back-button","stop-reload-button","new-tab-button","forward-button","urlbar-container","unified-extensions-button"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["tabbrowser-tabs","alltabs-button","_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action","_7a7a4a92-a2a0-41d1-9fd7-1e92480d612d_-browser-action","userchrome-toggle_joolee_nl-browser-action","addon_darkreader_org-browser-action","downloads-button"],"vertical-tabs":[],"PersonalToolbar":["personal-bookmarks"]},"seen":["save-to-pocket-button","side-view_mozilla_org-browser-action","userchrome-toggle_joolee_nl-browser-action","_84c8edb0-65ca-43a5-bc53-0e80f41486e1_-browser-action","addon_darkreader_org-browser-action","addon_fastforward_team-browser-action","enhancerforyoutube_maximerf_addons_mozilla_org-browser-action","firefox_tampermonkey_net-browser-action","infy-scroll_webextensions-browser-action","plasma-browser-integration_kde_org-browser-action","ublock0_raymondhill_net-browser-action","_2e5ff8c8-32fe-46d0-9fc8-6b8986621f3c_-browser-action","_34daeb50-c2d2-4f14-886a-7160b24d66a4_-browser-action","_3c078156-979c-498b-8990-85f7987dd929_-browser-action","_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action","_762f9885-5a13-4abd-9c77-433dcd38b8fd_-browser-action","_7a7a4a92-a2a0-41d1-9fd7-1e92480d612d_-browser-action","_a6c4a591-f1b2-4f03-b3ff-767e5bedf4e7_-browser-action","_e58d3966-3d76-4cd9-8552-1582fbc800c1_-browser-action","sponsorblocker_ajay_app-browser-action","dearrow_ajay_app-browser-action","developer-button","2_0_disconnect_me-browser-action","wayback_machine_mozilla_org-browser-action","_b56933a8-6429-4ef4-88df-7f3b37f7e1fc_-browser-action","idcac-pub_guus_ninja-browser-action","newtaboverride_agenedia_com-browser-action","firefoxpwa_filips_si-browser-action","_56b215f4-29b6-4898-bf2a-152d8bc189ed_-browser-action","_windscribeff-browser-action","user-agent-switcher_ninetailed_ninja-browser-action","_eb8f96ca-d31a-4f74-89ad-c25045497adb_-browser-action","_c2c003ee-bd69-42a2-b0e9-6f34222cb046_-browser-action"],"dirtyAreaCache":["unified-extensions-area","nav-bar","TabsToolbar","toolbar-menubar","PersonalToolbar","widget-overflow-fixed-list","vertical-tabs"],"currentVersion":20,"newElementCount":19}'';
      };

      userChrome = builtins.readFile ./userChrome.css;
      userContent = builtins.readFile ./userContext.css;
    };

    # Enable extensions by default
    policies = {
      Extensions.Locked = [
        "1be309c5-3e4f-4b99-927d-bb500eb4fa88" # Augmented Steam
        "c2c003ee-bd69-42a2-b0e9-6f34222cb046" # Auto Tab Discard
        "4b7afe32-50fa-4a37-b2e8-83f848b34530" # AutoMail
        "446900e4-71c2-419f-a6a7-df9c091e268b" # Bitwarden
        "e58d3966-3d76-4cd9-8552-1582fbc800c1" # Buster Captcha Solver
        "addon@darkreader.org" # Dark Reader
        "addon@fastforward.team" # Fast Forward
        "56b215f4-29b6-4898-bf2a-152d8bc189ed" # Fox Scroller
        "idcac-pub@guus.ninja" # I Still Don't Care About Cookies
        "infy-scroll@webextensions" # Infy Scroll
        "e80594de-acca-4551-af7a-c9bd9d2f3388" # Prevent Duplicate Tabs
        "firefoxpwa@filips.si" # Progressive Web Apps for Firefox
        "jid1-xUfzOsOFlzSOXg@jetpack" # Reddit Enhancement Suite
        "redirector@einaregilsson.com" # Redirector
        "762f9885-5a13-4abd-9c77-433dcd38b8fd" # Return YouTube Dislikes
        "2e5ff8c8-32fe-46d0-9fc8-6b8986621f3c" # Search by Image
        "shinigamieyes@shinigamieyes" # Shinigami Eyes
        "3c078156-979c-498b-8990-85f7987dd929" # Sidebery
        "sponsorBlocker@ajay.app" # SponsorBlock
        "firefox-extension@steamdb.info" # SteamDB
        "7a7a4a92-a2a0-41d1-9fd7-1e92480d612d" # Stylus
        "jid1-KdTtiCj6wxVAFA@jetpack" # Swift Selection Search
        "default-theme@mozilla.org" # System Theme Auto
        "firefox@tampermonkey.net" # Tampermonkey
        "uBlock0@raymondhill.net" # uBlock Origin
        "user-agent-switcher@ninetailed.ninja" # User Agent Switcher
        "a6c4a591-f1b2-4f03-b3ff-767e5bedf4e7" # Use Agent Switcher & Manager
        "userchrome-toggle@joolee.nl" # UserChrome Toggle
        "wayback_machine@mozilla.org" # Wayback Machine
        "@windscribeff" # Windscribe
        "34daeb50-c2d2-4f14-886a-7160b24d66a4" # YouTube Shorts Block
      ];
    };
  };
}
