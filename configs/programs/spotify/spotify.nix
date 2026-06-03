{
  pkgs,
  inputs,
  config,
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
      text = removeHashtag "${config.theme.text}";
      subtext = removeHashtag "${config.theme.subtext}";
      sidebar-text = removeHashtag "${config.theme.text}";
      main = removeHashtag "${config.theme.section}";
      sidebar = removeHashtag "${config.theme.section}";
      player = removeHashtag "${config.theme.section}";
      card = removeHashtag "${config.theme.section}";
      shadow = removeHashtag "${config.theme.base}";
      selected-row = removeHashtag "${config.theme.accent}";
      button = removeHashtag "${config.theme.accent}";
      button-active = removeHashtag "${config.theme.accent-bright}";
      button-disabled = removeHashtag "${config.theme.accent-dim}";
      tab-active = removeHashtag "${config.theme.card}";
      notification = removeHashtag "${config.theme.accent}";
      notification-error = removeHashtag "${config.theme.red}";
      misc = removeHashtag "${config.theme.pink}";
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
