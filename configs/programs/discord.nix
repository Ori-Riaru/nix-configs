{
  pkgs,
  inputs,
  ...
}: {
  # home.packages = with pkgs; [
  #   (discord.override {
  #     withVencord = true;
  #     withOpenASAR = true;
  #   })
  # ];

  # Switched to Vesktop because of https://github.com/NixOS/nixpkgs/issues/195512
  programs.vesktop = {
    enable = true;

    vencord = {
      themes = {
        "adblock" = "@import url(https://croissantdunord.github.io/discord-adblock/adblock.css);";
      };

      settings = {
        autoUpdate = false;
        autoUpdateNotification = false;
        notifyAboutUpdates = false;
        disableMinSize = true;
        enabledThemes = [
          "adblock.css"
        ];
        plugins = {
          FakeNitro.enabled = true;
          VolumeBooster.enabled = true;
          AlwaysTrust.enabled = true;
          AnonymiseFileNames.enabled = true;
          BetterGifAltText.enabled = true;
          BetterGifPicker.enabled = true;
          BiggerStreamPreview.enabled = true;
          CallTimer.enabled = true;
          ImageZoom.enabled = true;
          InvisibleChat.enabled = true;
          MessageLinkEmbeds.enabled = true;
          MessageLogger.enabled = true;
          NoPendingCount = {
            enabled = true;
            hideFriendRequestsCount = false;
            hideMessageRequestsCount = false;
            hidePremiumOffersCount = true;
          };
          NoProfileThemes.enabled = true;
          RoleColorEverywhere.enabled = true;
          ShikiCodeblocks.enabled = true;
          ShowHiddenChannels.enabled = true;
          ShowMeYourName.enabled = true;
          SilentTyping.enabled = true;
          UserMessagesPronouns.enabled = true;
          USRBG.enabled = true;
          YoutubeAdblock.enabled = true;
          CrashHandler.enabled = true;
          WebKeybinds.enabled = true;
          WebScreenShareFixes.enabled = true;
          ClearURLs.enabled = true;
        };
      };
    };
  };
}
