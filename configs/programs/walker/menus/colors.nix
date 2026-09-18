{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (config) theme;

  icon = "preferences-color-symbolic";

  mkSvg = hex: "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 32 32\"><rect width=\"30\" height=\"30\" x=\"1\" y=\"1\" rx=\"6.5\" fill=\"${hex}\" stroke=\"#ffffff\" stroke-opacity=\"0.4\"/></svg>";

  swatches = let
    mkSwatch = name: hex: {
      inherit name hex;
    };
    fgBg = [
      (mkSwatch "white" theme.white)
      (mkSwatch "black" theme.black)
      (mkSwatch "text" theme.text)
      (mkSwatch "subtext" theme.subtext)
      (mkSwatch "muted" theme.muted)
      (mkSwatch "hidden" theme.hidden)
      (mkSwatch "base" theme.base)
      (mkSwatch "section" theme.section)
      (mkSwatch "card" theme.card)
      (mkSwatch "overlay" theme.overlay)
      (mkSwatch "float" theme.float)
    ];
    groupSwatches = lib.concatMap (g: [
      (mkSwatch g.name theme.${g.name})
      (mkSwatch "${g.name}-bright" theme.${"${g.name}-bright"})
      (mkSwatch "${g.name}-dim" theme.${"${g.name}-dim"})
      (mkSwatch "${g.name}-dark" theme.${"${g.name}-dark"})
    ]) paletteGroups;
  in
    fgBg ++ groupSwatches;

  colorIcons = pkgs.runCommand "elephant-color-icons" {} (
    "mkdir -p $out\n"
    + lib.concatMapStringsSep "\n" (c: "echo ${lib.escapeShellArg (mkSvg c.hex)} > $out/${c.name}.svg") swatches
  );

  swatch = name: "${colorIcons}/${name}.svg";

  hexToRgb = hex: let
    clean = builtins.substring 1 (builtins.stringLength hex - 1) hex;
    r = fromTOML "x=0x${builtins.substring 0 2 clean}";
    g = fromTOML "x=0x${builtins.substring 2 2 clean}";
    b = fromTOML "x=0x${builtins.substring 4 2 clean}";
  in "${toString r.x},${toString g.x},${toString b.x}";

  # Palette groups that follow the base/bright/dim/dark pattern.
  paletteGroups = [
    {
      name = "accent";
      pretty = "Accent";
    }
    {
      name = "secondary";
      pretty = "Secondary";
    }
    {
      name = "tertiary";
      pretty = "Tertiary";
    }
    {
      name = "red";
      pretty = "Red";
    }
    {
      name = "orange";
      pretty = "Orange";
    }
    {
      name = "yellow";
      pretty = "Yellow";
    }
    {
      name = "green";
      pretty = "Green";
    }
    {
      name = "teal";
      pretty = "Teal";
    }
    {
      name = "cyan";
      pretty = "Cyan";
    }
    {
      name = "blue";
      pretty = "Blue";
    }
    {
      name = "purple";
      pretty = "Purple";
    }
    {
      name = "pink";
      pretty = "Pink";
    }
    {
      name = "brown";
      pretty = "Brown";
    }
  ];

  mkCopyEntry = {
    label,
    subtext,
    value,
    icon ? "preferences-color-symbolic",
    keywords ? [],
  }: {
    text = label;
    inherit subtext value;
    icon = icon;
    keywords = ["color" label] ++ keywords;
    actions = {
      copy = "wl-copy '%VALUE%'";
    };
  };

  mkColorEntry = label: attr: hex:
    (mkCopyEntry {
      inherit label;
      subtext = hex;
      value = hex;
      keywords = [hex];
      icon = swatch attr;
    })
    // {
      actions = {
        copy = "wl-copy '%VALUE%'";
        copy-rgb = "wl-copy ${hexToRgb hex}";
      };
    };

  submenu = text: submenu: keywords: swatchName: {
    inherit text submenu keywords;
    icon = swatch swatchName;
  };

  mkMenu = {
    name,
    name_pretty,
    entries,
    swatchName ? null,
    topLevel ? false,
  }: {
    inherit name name_pretty entries;
    icon = if swatchName == null then icon else swatch swatchName;
    fixed_order = true;
  } // lib.optionalAttrs (!topLevel) {
    parent = "colors";
    hide_from_providerlist = true;
  };

  mkGroupMenu = group:
    mkMenu {
      name = "colors${group.pretty}";
      name_pretty = group.pretty;
      swatchName = group.name;
      entries = map (v: mkColorEntry v.label v.attr theme.${v.attr}) [
        {
          label = group.pretty;
          attr = group.name;
        }
        {
          label = "${group.pretty} Bright";
          attr = "${group.name}-bright";
        }
        {
          label = "${group.pretty} Dim";
          attr = "${group.name}-dim";
        }
        {
          label = "${group.pretty} Dark";
          attr = "${group.name}-dark";
        }
      ];
    };

  colorMenus =
    {
      colors = {
        name = "colors";
        name_pretty = "Colors";
        description = "Copy theme colors";
        icon = swatch "accent";
        fixed_order = true;
        entries =
          [
            (submenu "Foreground" "colorsForeground" ["fg" "foreground" "text"] "text")
            (submenu "Background" "colorsBackground" ["bg" "background" "base"] "base")
          ]
          ++ (map (g:
            submenu g.pretty "colors${g.pretty}" [g.name g.pretty "hue"] g.name) paletteGroups);
      };

      colorsForeground = mkMenu {
        name = "colorsForeground";
        name_pretty = "Foreground";
        swatchName = "text";
        entries = [
          (mkColorEntry "White" "white" theme.white)
          (mkColorEntry "Black" "black" theme.black)
          (mkColorEntry "Text" "text" theme.text)
          (mkColorEntry "Subtext" "subtext" theme.subtext)
          (mkColorEntry "Muted" "muted" theme.muted)
          (mkColorEntry "Hidden Text" "hidden" theme.hidden)
        ];
      };

      colorsBackground = mkMenu {
        name = "colorsBackground";
        name_pretty = "Background";
        swatchName = "base";
        entries = [
          (mkColorEntry "Base" "base" theme.base)
          (mkColorEntry "Section" "section" theme.section)
          (mkColorEntry "Card" "card" theme.card)
          (mkColorEntry "Overlay" "overlay" theme.overlay)
          (mkColorEntry "Float" "float" theme.float)
        ];
      };

      layoutPrefs = mkMenu {
        name = "layoutPrefs";
        name_pretty = "Layout";
        topLevel = true;
        entries = [
          (mkCopyEntry {
            label = "Font";
            subtext = theme.font;
            value = theme.font;
            keywords = [theme.font];
          })
          (mkCopyEntry {
            label = "Monospace Font";
            subtext = theme.fontMonospace;
            value = theme.fontMonospace;
            keywords = [theme.fontMonospace "monospace"];
          })
          (mkCopyEntry {
            label = "Gap Size";
            subtext = "${toString theme.gap}px";
            value = "${toString theme.gap}px";
            keywords = ["gap" "spacing"];
          })
          (mkCopyEntry {
            label = "Border Width";
            subtext = "${toString theme.border-width}px";
            value = "${toString theme.border-width}px";
            keywords = ["border" "width" "border-width"];
          })
          (mkCopyEntry {
            label = "Border Radius";
            subtext = "${toString theme.radius}px";
            value = "${toString theme.radius}px";
            keywords = ["radius" "corners"];
          })
          (mkCopyEntry {
            label = "Border Radius Small";
            subtext = "${toString theme.radius-s}px";
            value = "${toString theme.radius-s}px";
            keywords = ["radius" "small" "corners"];
          })
          (mkCopyEntry {
            label = "Spacing XS";
            subtext = "${toString theme.spacing-xs}px";
            value = "${toString theme.spacing-xs}px";
            keywords = ["spacing" "xs"];
          })
          (mkCopyEntry {
            label = "Spacing S";
            subtext = "${toString theme.spacing-s}px";
            value = "${toString theme.spacing-s}px";
            keywords = ["spacing" "s" "small"];
          })
          (mkCopyEntry {
            label = "Spacing M";
            subtext = "${toString theme.spacing-m}px";
            value = "${toString theme.spacing-m}px";
            keywords = ["spacing" "m" "medium"];
          })
          (mkCopyEntry {
            label = "Spacing L";
            subtext = "${toString theme.spacing-l}px";
            value = "${toString theme.spacing-l}px";
            keywords = ["spacing" "l" "large"];
          })
          (mkCopyEntry {
            label = "Spacing XL";
            subtext = "${toString theme.spacing-xl}px";
            value = "${toString theme.spacing-xl}px";
            keywords = ["spacing" "xl"];
          })
          (mkCopyEntry {
            label = "Spacing XXL";
            subtext = "${toString theme.spacing-xxl}px";
            value = "${toString theme.spacing-xxl}px";
            keywords = ["spacing" "xxl"];
          })
        ];
      };
    }
    // builtins.listToAttrs
    (map (g: lib.nameValuePair "colors${g.pretty}" (mkGroupMenu g)) paletteGroups);

  colorBinds =
    builtins.listToAttrs
    (map
      (menu:
        lib.nameValuePair
        "menus:${menu}"
        [
          {
            action = "copy";
            label = "Copy Hex";
            bind = "Return";
          }
          {
            action = "copy-rgb";
            label = "Copy RGB";
            bind = "shift Return";
          }
        ])
      (map (n: "colors${n.pretty}") paletteGroups ++ ["colorsForeground" "colorsBackground" "layoutPrefs"]));
in {
  programs.elephant.provider.menus.toml = colorMenus;

  programs.walker.config.providers.actions = colorBinds;
}