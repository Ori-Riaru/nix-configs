{pkgs, ...}: {
  # home.packages = with pkgs; [
  #   (discord.override {
  #     withVencord = true;
  #     withOpenASAR = true;
  #   })
  # ];

  # Switched to Vesktop because of https://github.com/NixOS/nixpkgs/issues/195512
  programs.vesktop = {
    enable = true;
    vencord.settings = {
      disableMinSize = true;
      plugins = {
        FakeNitro.enable = true;
        VolumeBooster.enable = true;
        AlwaysTrust.enable = true;
        AnonymiseFileNames.enable = true;
        BetterGifAltText.enable = true;
        BetterGifPicker.enable = true;
        BiggerStreamPreview.enable = true;
        CallTimer.enable = true;
        ImageZoom.enable = true;
        InvisibleChat.enable = true;
        MessageLinkEmbeds.enable = true;
        MessageLogger.enable = true;
        NoPendingCount = {
          enable = true;
          hideFriendRequestsCount = false;
          hideMessageRequestsCount = false;
          hidePremiumOffersCount = true;
        };
        NoProfileThemes.enable = true;
        RoleColorEverywhere.enable = true;
        ShikiCodeBlocks.enable = true;
        ShowHiddenChannels.enable = true;
        ShowMeYourName.enable = true;
        SilentTyping.enable = true;
        UserMessagePronouns.enable = true;
        USRGB.enable = true;
        YoutubeAdblock.enable = true;
      };
    };
  };
}
