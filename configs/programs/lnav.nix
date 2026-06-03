{
  pkgs,
  config,
  settings,
  ...
}: {
  home.packages = with pkgs; [
    lnav
  ];

  home.file.".config/lnav/config.json".text = ''
    {
        "$schema": "https://lnav.org/schemas/config-v1.schema.json",
        "tuning": {
            "external-editor": {
                "impls": {
                    "IntelliJ": {
                        "prefers": "^.*(?:\\.java|\\.kt|\\.py)$"
                    },
                    "RustRover": {
                        "prefers": "^.*(?:Cargo.toml|\\.rs)"
                    }
                }
            }
        },
        "ui": {
            "theme": "neutral-dark",
            "theme-defs": {
                "default": {
                    "highlights": {
                        "colors": {
                            "pattern": "(?:#[a-fA-F0-9]{6}|#[a-fA-F0-9]{3}\\b)"
                        },
                        "ipv4": {
                            "pattern": "\\b(?<!\\d\\.)\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\b(?!\\.\\d)"
                        },
                        "xml": {
                            "pattern": "</?([^ >=!]+)[^>]*>"
                        },
                        "xml-decl": {
                            "pattern": "<!([^ >=!]+)[^>]*>"
                        }
                    }
                }
            }
        },
        "log": {
            "demux": {
                "container": {
                    "pattern": "^(?:\\x1b\\[\\d*K)?(?<mux_id>[a-zA-Z0-9][\\@a-zA-Z0-9_\\.\\-]*)\\s+\\| (?<timestamp>\\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}:\\d{2}.\\d{9}Z )?(?<body>.*)"
                },
                "container-with-type": {
                    "pattern": "^(?<mux_id>[a-zA-Z][\\w\\-]{3,}) (?<container_type>[a-zA-Z][\\w\\-]{3,}) (?<body>.*)"
                },
                "recv-with-pod": {
                    "pattern": "^(?<timestamp>\\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}:\\d{2}\\.\\d{3}(?:Z|[+\\-]\\d{2}:\\d{2})) source=[a-zA-Z0-9][a-zA-Z0-9_\\.\\-]* (?<body>.*) kubernetes_host=(?<k8s_host>[a-zA-Z0-9][a-zA-Z0-9_\\.\\-]*) kubernetes_pod_name=(?<mux_id>[a-zA-Z0-9][a-zA-Z0-9_\\.\\-]*)",
                    "control-pattern": "^===== (?:START|END) =====$"
                }
            }
        }
    }
  '';

  home.file.".config/lnav/configs/installed/neutral-dark.json".text = ''
        {
      "$schema": "https://lnav.org/schemas/config-v1.schema.json",
      "ui": {
        "theme-defs": {
          "neutral-dark": {
            "vars": {
              "base": "${config.theme.base}",
              "section": "${config.theme.section}",
              "card": "${config.theme.card}",
              "overlay": "${config.theme.overlay}",
              "float": "${config.theme.float}",
              "grey": "${config.theme.subtext}",
              "black": "${config.theme.base}",
              "text": "${config.theme.text}",
              "subtext": "${config.theme.subtext}",
              "muted": "${config.theme.muted}",
              "hidden": "${config.theme.hidden}",
              "white": "${config.theme.text}",
              "red": "${config.theme.red}",
              "red_bright": "${config.theme.red-bright}",
              "red_dim": "${config.theme.red-dim}",
              "red_dark": "${config.theme.red-dark}",
              "orange": "${config.theme.orange}",
              "orange_bright": "${config.theme.orange-bright}",
              "orange_dim": "${config.theme.orange-dim}",
              "orange_dark": "${config.theme.orange-dark}",
              "yellow": "${config.theme.yellow}",
              "yellow_bright": "${config.theme.yellow-bright}",
              "yellow_dim": "${config.theme.yellow-dim}",
              "yellow_dark": "${config.theme.yellow-dark}",
              "green": "${config.theme.green}",
              "green_bright": "${config.theme.green-bright}",
              "green_dim": "${config.theme.green-dim}",
              "green_dark": "${config.theme.green-dark}",
              "teal": "${config.theme.teal}",
              "teal_bright": "${config.theme.teal-bright}",
              "teal_dim": "${config.theme.teal-dim}",
              "teal_dark": "${config.theme.teal-dark}",
              "cyan": "${config.theme.cyan}",
              "cyan_bright": "${config.theme.cyan-bright}",
              "cyan_dim": "${config.theme.cyan-dim}",
              "cyan_dark": "${config.theme.cyan-dark}",
              "blue": "${config.theme.blue}",
              "blue_bright": "${config.theme.blue-bright}",
              "blue_dim": "${config.theme.blue-dim}",
              "blue_dark": "${config.theme.blue-dark}",
              "purple": "${config.theme.purple}",
              "purple_bright": "${config.theme.purple-bright}",
              "purple_dim": "${config.theme.purple-dim}",
              "purple_dark": "${config.theme.purple-dark}",
              "pink": "${config.theme.pink}",
              "pink_bright": "${config.theme.pink-bright}",
              "pink_dim": "${config.theme.pink-dim}",
              "pink_dark": "${config.theme.pink-dark}",
              "brown": "${config.theme.brown}",
              "brown_bright": "${config.theme.brown-bright}",
              "brown_dim": "${config.theme.brown-dim}",
              "brown_dark": "${config.theme.brown-dark}",
              "selection": "${config.theme.overlay}",
              "comment": "${config.theme.muted}",
              "accent_bright": "${config.theme.accent-bright}",
              "accent": "${config.theme.accent}",
              "accent_dim": "${config.theme.accent-dim}",
              "accent_dark": "${config.theme.accent-dark}",
              "secondary_bright": "${config.theme.secondary-bright}",
              "secondary": "${config.theme.secondary}",
              "secondary_dim": "${config.theme.secondary-dim}",
              "secondary_dark": "${config.theme.secondary-dark}"
            },
            "styles": {
              "identifier": {
                "color": "$accent_dim"
              },
              "text": {
                "color": "$text",
                "background-color": "$section"
              },
              "selected-text": {
                "color": "$white",
                "background-color": "$selection"
              },
              "fuzzy-match": {
                "color": "$orange",
                "underline": true,
                "bold": true
              },
              "alt-text": {
                "color": "$text"
              },
              "ok": {
                "color": "$green",
                "bold": true
              },
              "info": {
                "color": "$cyan",
                "bold": true
              },
              "error": {
                "color": "$red",
                "bold": true
              },
              "warning": {
                "color": "$yellow",
                "bold": true
              },
              "hidden": {
                "color": "$hidden"
              },
              "cursor-line": {
                "color": "$white",
                "background-color": "$selection",
                "bold": true
              },
              "disabled-cursor-line": {
                "color": "$subtext",
                "background-color": "$card"
              },
              "adjusted-time": {
                "color": "$pink",
                "italic": true
              },
              "skewed-time": {
                "color": "$yellow",
                "italic": true
              },
              "offset-time": {
                "color": "$teal"
              },
              "time-column": {
                "color": "$subtext",
                "background-color": "$card"
              },
              "file-offset": {
                "color": "$hidden"
              },
              "invalid-msg": {
                "color": "$orange",
                "italic": true
              },
              "popup": {
                "color": "$text",
                "background-color": "$overlay"
              },
              "popup-border": {
                "color": "$accent_dim",
                "background-color": "$overlay"
              },
              "focused": {
                "color": "$section",
                "background-color": "$accent_bright",
                "bold": true
              },
              "disabled-focused": {
                "color": "$subtext",
                "background-color": "$accent_dim"
              },
              "scrollbar": {
                "color": "$accent_dim",
                "background-color": "$card"
              },
              "timeline-bar": {
                "background-color": "$accent"
              },
              "h1": {
                "color": "$accent",
                "bold": true
              },
              "h2": {
                "color": "$accent",
                "underline": true
              },
              "h3": {
                "color": "$secondary",
                "bold": true
              },
              "h4": {
                "color": "$secondary",
                "underline": true
              },
              "h5": {
                "color": "$subtext",
                "italic": true
              },
              "h6": {
                "color": "$hidden",
                "italic": true
              },
              "hr": {
                "color": "$comment"
              },
              "hyperlink": {
                "color": "$secondary",
                "underline": true
              },
              "list-glyph": {
                "color": "$accent_dim"
              },
              "breadcrumb": {
                "color": "$subtext",
                "bold": true
              },
              "table-border": {
                "color": "$grey"
              },
              "table-header": {
                "color": "$accent_bright",
                "bold": true
              },
              "quote-border": {
                "color": "$comment",
                "background-color": "$card"
              },
              "quoted-text": {
                "color": "$yellow",
                "background-color": "$card"
              },
              "footnote-border": {
                "color": "$secondary_dim",
                "background-color": "$card"
              },
              "footnote-text": {
                "color": "$cyan",
                "background-color": "$card"
              },
              "snippet-border": {
                "color": "$accent_dim"
              },
              "indent-guide": {
                "color": "$grey"
              }
            },
            "syntax-styles": {
              "inline-code": {
                "color": "$green",
                "background-color": "$card"
              },
              "quoted-code": {
                "color": "$teal",
                "background-color": "$card"
              },
              "code-border": {
                "color": "$grey",
                "background-color": "$card"
              },
              "object-key": {
                "color": "$accent_dim"
              },
              "keyword": {
                "color": "$accent",
                "bold": true
              },
              "string": {
                "color": "$yellow"
              },
              "comment": {
                "color": "$comment",
                "italic": true
              },
              "doc-directive": {
                "color": "$pink",
                "italic": true
              },
              "variable": {
                "color": "$orange"
              },
              "symbol": {
                "color": "$cyan"
              },
              "null": {
                "color": "$subtext",
                "italic": true
              },
              "ascii-control": {
                "color": "$teal",
                "bold": true
              },
              "non-ascii": {
                "color": "$orange"
              },
              "number": {
                "color": "$pink"
              },
              "type": {
                "color": "$cyan",
                "italic": true
              },
              "function": {
                "color": "$green"
              },
              "separators-references-accessors": {
                "color": "$accent_dim"
              },
              "re-special": {
                "color": "$teal",
                "bold": true
              },
              "re-repeat": {
                "color": "$yellow",
                "bold": true
              },
              "diff-delete": {
                "color": "$red",
                "background-color": "$red_dark"
              },
              "diff-add": {
                "color": "$green",
                "background-color": "$green_dark"
              },
              "diff-section": {
                "color": "$secondary",
                "background-color": "$secondary_dark",
                "bold": true
              },
              "spectrogram-low": {
                "color": "$section",
                "background-color": "$green",
                "bold": true
              },
              "spectrogram-medium": {
                "color": "$section",
                "background-color": "$yellow",
                "bold": true
              },
              "spectrogram-high": {
                "color": "$section",
                "background-color": "$red",
                "bold": true
              },
              "file": {
                "color": "$secondary",
                "underline": true
              }
            },
            "status-styles": {
              "text": {
                "color": "$text",
                "background-color": "$card"
              },
              "warn": {
                "color": "$orange",
                "background-color": "$card"
              },
              "alert": {
                "color": "$red",
                "background-color": "$card",
                "bold": true
              },
              "active": {
                "color": "$green",
                "background-color": "$card"
              },
              "inactive": {
                "color": "$hidden",
                "background-color": "$section"
              },
              "inactive-warn": {
                "color": "$orange",
                "background-color": "$section"
              },
              "inactive-alert": {
                "color": "$red",
                "background-color": "$section"
              },
              "title": {
                "color": "$section",
                "background-color": "$accent_bright",
                "bold": true
              },
              "alert-title": {
                "color": "$section",
                "background-color": "$red",
                "bold": true
              },
              "disabled-title": {
                "color": "$subtext",
                "background-color": "$grey"
              },
              "subtitle": {
                "color": "$section",
                "background-color": "$secondary",
                "bold": true
              },
              "info": {
                "color": "$subtext",
                "background-color": "$card"
              },
              "title-hotkey": {
                "color": "$yellow_bright",
                "background-color": "$accent_bright",
                "underline": true,
                "bold": true
              },
              "hotkey": {
                "color": "$yellow",
                "underline": true
              },
              "suggestion": {
                "color": "$comment",
                "italic": true
              }
            },
            "log-level-styles": {
              "trace": {
                "color": "$hidden"
              },
              "debug5": {
                "color": "$hidden"
              },
              "debug4": {
                "color": "$hidden"
              },
              "debug3": {
                "color": "$subtext"
              },
              "debug2": {
                "color": "$subtext"
              },
              "debug": {
                "color": "$subtext"
              },
              "info": {
                "color": "$secondary"
              },
              "stats": {
                "color": "$teal"
              },
              "notice": {
                "color": "$cyan"
              },
              "warning": {
                "color": "$yellow"
              },
              "error": {
                "color": "$red",
                "bold": true
              },
              "critical": {
                "color": "$red",
                "bold": true,
                "underline": true
              },
              "fatal": {
                "color": "$white",
                "background-color": "$red",
                "bold": true
              },
              "invalid": {
                "color": "$orange",
                "italic": true
              }
            }
          }
        }
      }
    }
  '';
}
