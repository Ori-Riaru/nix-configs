{
  pkgs,
  inputs,
  settings,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  removeHashtag = str: builtins.substring 1 (builtins.stringLength str) str;
in {
  imports = [inputs.spicetify-nix.homeManagerModules.spicetify];

  programs.spicetify = {
    enable = true;
    wayland = true;
    theme =
      spicePkgs.themes.dribbblish
      // {
        additionalCss = builtins.readFile ./spotify.css;
      };

    colorScheme = "custom";
    customColorScheme = {
      text = removeHashtag "${settings.text}";
      subtext = removeHashtag "${settings.subtext}";
      sidebar-text = removeHashtag "${settings.text}";
      main = removeHashtag "${settings.section}";
      sidebar = removeHashtag "${settings.section}";
      player = removeHashtag "${settings.section}";
      card = removeHashtag "${settings.section}";
      shadow = removeHashtag "${settings.base}";
      selected-row = removeHashtag "${settings.accent}";
      button = removeHashtag "${settings.accent}";
      button-active = removeHashtag "${settings.accent-bright}";
      button-disabled = removeHashtag "${settings.accent-dim}";
      tab-active = removeHashtag "${settings.card}";
      notification = removeHashtag "${settings.accent}";
      notification-error = removeHashtag "${settings.red}";
      misc = removeHashtag "${settings.pink}";
    };

    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      bookmark
      fullAppDisplay
      hidePodcasts
      shuffle
      {
        name = "LibX-Reborn.js";
        src = "${
          pkgs.fetchFromGitHub {
            owner = "sanoojes";
            repo = "spicetify-extensions";
            rev = "master";
            hash = "sha256-5utd06qI/o7b/YFSKwSGvtHhkAopH7akxd2VI6boZwo=";
          }
        }/LibX-Reborn/src";
      }
    ];
    enabledCustomApps = with spicePkgs.apps; [
      marketplace
    ];
  };
}
