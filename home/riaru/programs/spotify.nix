{
  pkgs,
  inputs,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in {
  imports = [inputs.spicetify-nix.homeManagerModules.default];

  programs.spicetify = {
    enable = true;

    # Theming
    theme = spicePkgs.themes.dribbblish;

    colorScheme = "custom";

    customColorScheme = {
      text = "FFFFFF";
      subtext = "FFFFFF";
      sidebar-text = "ffffff";
      main = "202020";
      sidebar = "151515";
      player = "202020";
      card = "202020";
      shadow = "1f1f1f";
      selected-row = "797979";
      button = "a080ff";
      button-active = "a080ff";
      button-disabled = "555169";
      tab-active = "252525";
      notification = "1db954";
      notification-error = "eb6f92";
      misc = "6e6a86";
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
