{
  pkgs,
  inputs,
  settings,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in {
  imports = [inputs.spicetify-nix.homeManagerModules.default];

  programs.spicetify = {
    enable = true;

    # Theming
    theme = spicePkgs.themes.dribbblish // {
      additionalCss = builtins.readFile ./spotify.css;
    };

    colorScheme = "custom";

    customColorScheme = {
      text = "${settings.text}";
      subtext = "${settings.subtext}";
      sidebar-text = "${settings.text}";
      main = "${settings.section}";
      sidebar = "${settings.base}";
      player = "${settings.section}";
      card = "${settings.section}";
      shadow = "${settings.black}";
      selected-row = "${settings.accent}";
      button = "${settings.accent}";
      button-active = "${settings.accent}";
      button-disabled = "${settings.grey}";
      tab-active = "${settings.card}";
      notification = "${settings.accent}";
      notification-error = "${settings.red}";
      misc = "${settings.pink}";
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
