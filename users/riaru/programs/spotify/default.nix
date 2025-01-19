{
  pkgs,
  inputs,
  settings,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};

  removeHashtag = str: builtins.substring 1 (builtins.stringLength str) str;
in {
  imports = [inputs.spicetify-nix.homeManagerModules.default];

  programs.spicetify = {
    enable = true;

    # Theming
    theme =
      spicePkgs.themes.dribbblish
      // {
        additionalCss = builtins.readFile ./spotify.css;
      };

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
      adblock
      bookmark
      copyToClipboard
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
        name = "/dist/css-editor.js";

        src = pkgs.fetchFromGitHub {
          owner = "FlafyDev";
          repo = "spotify-css-editor";
          rev = "main";
          hash = "sha256-uHPKHr55I0VCZIob3kDxbT5dFp/HrthL9Z7lbebTmrU=";
        };
      }
    ];

    enabledCustomApps = with spicePkgs.apps; [
      marketplace

      {
        src = pkgs.fetchFromGitHub {
          owner = "harbassan";
          repo = "spicetify-apps";
          rev = "dist";
          hash = "sha256-JqJGLL96eABeV9Trp0Gevmjw8FqazCLu+9fsRvMR/KI=";
        };

        name = "extension.js";
      }
    ];
  };
}
