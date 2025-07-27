{
  pkgs,
  inputs,
  settings,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
  removeHashtag = str: builtins.substring 1 (builtins.stringLength str) str;
in {
  imports = [inputs.spicetify-nix.homeManagerModules.spicetify];

  programs.spicetify = {
    enable = true;
    wayland = true;
    # theme = spicePkgs.themes.dribbblish; (broken)
    # // {
    #   additionalCss = builtins.readFile ./spotify.css;
    # };

    colorScheme = "custom";
    customColorScheme = {
      text = removeHashtag "${settings.text}";
      subtext = removeHashtag "${settings.text}";
      sidebar-text = removeHashtag "${settings.text}";
      main = removeHashtag "${settings.section}";
      sidebar = removeHashtag "${settings.base}";
      player = removeHashtag "${settings.section}";
      card = removeHashtag "${settings.section}";
      shadow = removeHashtag "${settings.black}";
      selected-row = removeHashtag "${settings.accent}";
      button = removeHashtag "${settings.accent}";
      button-active = removeHashtag "${settings.accent}";
      button-disabled = removeHashtag "${settings.grey}";
      tab-active = removeHashtag "${settings.card}";
      notification = removeHashtag "${settings.accent}";
      notification-error = removeHashtag "${settings.red}";
      misc = removeHashtag "${settings.pink}";
    };

    # Extensions
    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      bookmark
      fullAppDisplay
      hidePodcasts
      shuffle

      {
        name = "utilities.js";
        src = pkgs.fetchFromGitHub {
          owner = "kyrie25";
          repo = "spicetify-utilities";
          rev = "main";
          hash = "sha256-LZcrmoA+SOpTeTiBeiOtneojzBhvbZfkawTyFRLhNk8=";
        };
      }

      {
        # Not working
        name = "css-editor.js";
        src = "${pkgs.fetchFromGitHub {
          owner = "FlafyDev";
          repo = "spotify-css-editor/dist";
          rev = "main";
          hash = "sha256-uHPKHr55I0VCZIob3kDxbT5dFp/HrthL9Z7lbebTmrU=";
        }}/dist";
      }                    

      # {
         # Not working 
         # name = "LibX-Reborn.js";
         # src = "${pkgs.fetchFromGitHub {
         #   owner = "sanoojes";
         #   repo = "spicetify-extensions";
         #   rev = "master";
         #   hash = "sha256-ztZFuXzTdPsfA/q2G2Ww1AHsDwAFqALT94zx4eQ2P4E=E";
         # }}/LibX-Reborn/src";
      # }
    ];

    enabledCustomApps = with spicePkgs.apps; [
      marketplace
    ];
  };
}
