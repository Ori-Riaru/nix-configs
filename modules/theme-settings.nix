{
  lib,
  theme,
  ...
}: {
  options.theme = with lib; {
    spacing-xs = mkOption {
      type = types.int;
      default = theme.spacing-xs;
    };
    spacing-s = mkOption {
      type = types.int;
      default = theme.spacing-s;
    };
    spacing-m = mkOption {
      type = types.int;
      default = theme.spacing-m;
    };
    spacing-l = mkOption {
      type = types.int;
      default = theme.spacing-l;
    };
    spacing-xl = mkOption {
      type = types.int;
      default = theme.spacing-xl;
    };
    spacing-xxl = mkOption {
      type = types.int;
      default = theme.spacing-xxl;
    };
    gap = mkOption {
      type = types.int;
      default = theme.gap;
    };
    radius = mkOption {
      type = types.int;
      default = theme.radius;
    };
    radius-s = mkOption {
      type = types.int;
      default = theme.radius-s;
    };
    border-width = mkOption {
      type = types.int;
      default = theme.border-width;
    };
    font = mkOption {
      type = types.str;
      default = theme.font;
    };
    fontMonospace = mkOption {
      type = types.str;
      default = theme.fontMonospace;
    };
    accent-bright = mkOption {
      type = types.str;
      default = theme.accent-bright;
    };
    accent = mkOption {
      type = types.str;
      default = theme.accent;
    };
    accent-dim = mkOption {
      type = types.str;
      default = theme.accent-dim;
    };
    accent-dark = mkOption {
      type = types.str;
      default = theme.accent-dark;
    };
    secondary-bright = mkOption {
      type = types.str;
      default = theme.secondary-bright;
    };
    secondary = mkOption {
      type = types.str;
      default = theme.secondary;
    };
    secondary-dim = mkOption {
      type = types.str;
      default = theme.secondary-dim;
    };
    secondary-dark = mkOption {
      type = types.str;
      default = theme.secondary-dark;
    };

    white = mkOption {
      type = types.str;
      default = theme.white;
    };
    text = mkOption {
      type = types.str;
      default = theme.text;
    };
    subtext = mkOption {
      type = types.str;
      default = theme.subtext;
    };
    muted = mkOption {
      type = types.str;
      default = theme.muted;
    };
    hidden = mkOption {
      type = types.str;
      default = theme.hidden;
    };
    float = mkOption {
      type = types.str;
      default = theme.float;
    };
    overlay = mkOption {
      type = types.str;
      default = theme.overlay;
    };
    card = mkOption {
      type = types.str;
      default = theme.card;
    };
    section = mkOption {
      type = types.str;
      default = theme.section;
    };
    base = mkOption {
      type = types.str;
      default = theme.base;
    };
    black = mkOption {
      type = types.str;
      default = theme.black;
    };

    red-dark = mkOption {
      type = types.str;
      default = theme.red-dark;
    };
    red-dim = mkOption {
      type = types.str;
      default = theme.red-dim;
    };
    red = mkOption {
      type = types.str;
      default = theme.red;
    };
    red-bright = mkOption {
      type = types.str;
      default = theme.red-bright;
    };

    orange-dark = mkOption {
      type = types.str;
      default = theme.orange-dark;
    };
    orange-dim = mkOption {
      type = types.str;
      default = theme.orange-dim;
    };
    orange = mkOption {
      type = types.str;
      default = theme.orange;
    };
    orange-bright = mkOption {
      type = types.str;
      default = theme.orange-bright;
    };

    yellow-dark = mkOption {
      type = types.str;
      default = theme.yellow-dark;
    };
    yellow-dim = mkOption {
      type = types.str;
      default = theme.yellow-dim;
    };
    yellow = mkOption {
      type = types.str;
      default = theme.yellow;
    };
    yellow-bright = mkOption {
      type = types.str;
      default = theme.yellow-bright;
    };

    green-dark = mkOption {
      type = types.str;
      default = theme.green-dark;
    };
    green-dim = mkOption {
      type = types.str;
      default = theme.green-dim;
    };
    green = mkOption {
      type = types.str;
      default = theme.green;
    };
    green-bright = mkOption {
      type = types.str;
      default = theme.green-bright;
    };

    teal-dark = mkOption {
      type = types.str;
      default = theme.teal-dark;
    };
    teal-dim = mkOption {
      type = types.str;
      default = theme.teal-dim;
    };
    teal = mkOption {
      type = types.str;
      default = theme.teal;
    };
    teal-bright = mkOption {
      type = types.str;
      default = theme.teal-bright;
    };

    cyan-dark = mkOption {
      type = types.str;
      default = theme.cyan-dark;
    };
    cyan-dim = mkOption {
      type = types.str;
      default = theme.cyan-dim;
    };
    cyan = mkOption {
      type = types.str;
      default = theme.cyan;
    };
    cyan-bright = mkOption {
      type = types.str;
      default = theme.cyan-bright;
    };
    blue-dark = mkOption {
      type = types.str;
      default = theme.blue-dark;
    };
    blue-dim = mkOption {
      type = types.str;
      default = theme.blue-dim;
    };
    blue = mkOption {
      type = types.str;
      default = theme.blue;
    };
    blue-bright = mkOption {
      type = types.str;
      default = theme.blue-bright;
    };

    purple-dark = mkOption {
      type = types.str;
      default = theme.purple-dark;
    };
    purple-dim = mkOption {
      type = types.str;
      default = theme.purple-dim;
    };
    purple = mkOption {
      type = types.str;
      default = theme.purple;
    };
    purple-bright = mkOption {
      type = types.str;
      default = theme.purple-bright;
    };

    pink-dark = mkOption {
      type = types.str;
      default = theme.pink-dark;
    };
    pink-dim = mkOption {
      type = types.str;
      default = theme.pink-dim;
    };
    pink = mkOption {
      type = types.str;
      default = theme.pink;
    };
    pink-bright = mkOption {
      type = types.str;
      default = theme.pink-bright;
    };

    brown-dark = mkOption {
      type = types.str;
      default = theme.brown-dark;
    };
    brown-dim = mkOption {
      type = types.str;
      default = theme.brown-dim;
    };
    brown = mkOption {
      type = types.str;
      default = theme.brown;
    };
    brown-bright = mkOption {
      type = types.str;
      default = theme.brown-bright;
    };
  };
}
