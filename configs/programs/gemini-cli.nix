{pkgs, ...}: {
  programs.gemini-cli = {
    enable = true;
    settings = {
      general = {
        previewFeatures = true;
        preferredEditor = "vscodium";
        disableUpdateNag = true;
        enableAutoUpdateNotification = false;
      };
      ui = {
        hideBanner = true;
        hideTips = true;
        accessibility = {
          disableLoadingPhrases = true;
          enableLoadingPhrases = true;
        };
      };
      security = {
        auth = {
          selectedType = "oauth-personal";
        };
      };
    };
  };
}
