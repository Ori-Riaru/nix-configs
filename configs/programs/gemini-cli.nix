{pkgs, ...}: {
  programs.gemini-cli = {
    enable = true;
    settings = {
      general = {
        preferredEditor = "vscodium";
        disableUpdateNag = true;
      };
      ui = {
        hideBanner = true;
        hideTips = true;
        accessibility = {
          disableLoadingPhrases = true;
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
