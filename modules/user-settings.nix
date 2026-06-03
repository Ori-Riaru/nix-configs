{
  lib,
  osConfig,
  ...
}: let
  sys = name: osConfig.theme.${name};
in {
  options.theme = with lib; {
    avatar = mkOption {
      type = types.path;
      default = "/mnt/nfs/riaru/Projects/nix-configs/users/riaru/avatar.png";
    };
    wallpaper = mkOption {
      type = types.path;
      default = "/mnt/nfs/riaru/Projects/nix-configs/users/riaru/wallpaper.png";
    };
    wallpaper2 = mkOption {
      type = types.path;
      default = "/mnt/nfs/riaru/Projects/nix-configs/users/riaru/wallpaper2.jpg";
    };
    spacing-xs = mkOption {
      type = types.int;
      default = sys "spacing-xs";
    };
    spacing-s = mkOption {
      type = types.int;
      default = sys "spacing-s";
    };
    spacing-m = mkOption {
      type = types.int;
      default = sys "spacing-m";
    };
    spacing-l = mkOption {
      type = types.int;
      default = sys "spacing-l";
    };
    spacing-xl = mkOption {
      type = types.int;
      default = sys "spacing-xl";
    };
    spacing-xxl = mkOption {
      type = types.int;
      default = sys "spacing-xxl";
    };
    gap = mkOption {
      type = types.int;
      default = sys "gap";
    };
    radius = mkOption {
      type = types.int;
      default = sys "radius";
    };
    radius-s = mkOption {
      type = types.int;
      default = sys "radius-s";
    };
    border-width = mkOption {
      type = types.int;
      default = sys "border-width";
    };
    font = mkOption {
      type = types.str;
      default = sys "font";
    };
    fontMonospace = mkOption {
      type = types.str;
      default = sys "fontMonospace";
    };
    accent-bright = mkOption {
      type = types.str;
      default = sys "accent-bright";
    };
    accent = mkOption {
      type = types.str;
      default = sys "accent";
    };
    accent-dim = mkOption {
      type = types.str;
      default = sys "accent-dim";
    };
    accent-dark = mkOption {
      type = types.str;
      default = sys "accent-dark";
    };
    secondary-bright = mkOption {
      type = types.str;
      default = sys "secondary-bright";
    };
    secondary = mkOption {
      type = types.str;
      default = sys "secondary";
    };
    secondary-dim = mkOption {
      type = types.str;
      default = sys "secondary-dim";
    };
    secondary-dark = mkOption {
      type = types.str;
      default = sys "secondary-dark";
    };
    white = mkOption {
      type = types.str;
      default = sys "white";
    };
    text = mkOption {
      type = types.str;
      default = sys "text";
    };
    subtext = mkOption {
      type = types.str;
      default = sys "subtext";
    };
    muted = mkOption {
      type = types.str;
      default = sys "muted";
    };
    hidden = mkOption {
      type = types.str;
      default = sys "hidden";
    };
    float = mkOption {
      type = types.str;
      default = sys "float";
    };
    overlay = mkOption {
      type = types.str;
      default = sys "overlay";
    };
    card = mkOption {
      type = types.str;
      default = sys "card";
    };
    section = mkOption {
      type = types.str;
      default = sys "section";
    };
    base = mkOption {
      type = types.str;
      default = sys "base";
    };

    red-dark = mkOption {
      type = types.str;
      default = sys "red-dark";
    };
    red-dim = mkOption {
      type = types.str;
      default = sys "red-dim";
    };
    red = mkOption {
      type = types.str;
      default = sys "red";
    };
    red-bright = mkOption {
      type = types.str;
      default = sys "red-bright";
    };
    orange-dark = mkOption {
      type = types.str;
      default = sys "orange-dark";
    };
    orange-dim = mkOption {
      type = types.str;
      default = sys "orange-dim";
    };
    orange = mkOption {
      type = types.str;
      default = sys "orange";
    };
    orange-bright = mkOption {
      type = types.str;
      default = sys "orange-bright";
    };
    yellow-dark = mkOption {
      type = types.str;
      default = sys "yellow-dark";
    };
    yellow-dim = mkOption {
      type = types.str;
      default = sys "yellow-dim";
    };
    yellow = mkOption {
      type = types.str;
      default = sys "yellow";
    };
    yellow-bright = mkOption {
      type = types.str;
      default = sys "yellow-bright";
    };
    green-dark = mkOption {
      type = types.str;
      default = sys "green-dark";
    };
    green-dim = mkOption {
      type = types.str;
      default = sys "green-dim";
    };
    green = mkOption {
      type = types.str;
      default = sys "green";
    };
    green-bright = mkOption {
      type = types.str;
      default = sys "green-bright";
    };
    teal-dark = mkOption {
      type = types.str;
      default = sys "teal-dark";
    };
    teal-dim = mkOption {
      type = types.str;
      default = sys "teal-dim";
    };
    teal = mkOption {
      type = types.str;
      default = sys "teal";
    };
    teal-bright = mkOption {
      type = types.str;
      default = sys "teal-bright";
    };
    cyan-dark = mkOption {
      type = types.str;
      default = sys "cyan-dark";
    };
    cyan-dim = mkOption {
      type = types.str;
      default = sys "cyan-dim";
    };
    cyan = mkOption {
      type = types.str;
      default = sys "cyan";
    };
    cyan-bright = mkOption {
      type = types.str;
      default = sys "cyan-bright";
    };
    blue-dark = mkOption {
      type = types.str;
      default = sys "blue-dark";
    };
    blue-dim = mkOption {
      type = types.str;
      default = sys "blue-dim";
    };
    blue = mkOption {
      type = types.str;
      default = sys "blue";
    };
    blue-bright = mkOption {
      type = types.str;
      default = sys "blue-bright";
    };
    purple-dark = mkOption {
      type = types.str;
      default = sys "purple-dark";
    };
    purple-dim = mkOption {
      type = types.str;
      default = sys "purple-dim";
    };
    purple = mkOption {
      type = types.str;
      default = sys "purple";
    };
    purple-bright = mkOption {
      type = types.str;
      default = sys "purple-bright";
    };
    pink-dark = mkOption {
      type = types.str;
      default = sys "pink-dark";
    };
    pink-dim = mkOption {
      type = types.str;
      default = sys "pink-dim";
    };
    pink = mkOption {
      type = types.str;
      default = sys "pink";
    };
    pink-bright = mkOption {
      type = types.str;
      default = sys "pink-bright";
    };
    brown-dark = mkOption {
      type = types.str;
      default = sys "brown-dark";
    };
    brown-dim = mkOption {
      type = types.str;
      default = sys "brown-dim";
    };
    brown = mkOption {
      type = types.str;
      default = sys "brown";
    };
    brown-bright = mkOption {
      type = types.str;
      default = sys "brown-bright";
    };
  };
}
