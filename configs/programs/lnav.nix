{
  pkgs,
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
              "base": "${settings.base}",
              "section": "${settings.section}",
              "card": "${settings.card}",
              "overlay": "${settings.overlay}",
              "grey": "${settings.grey}",
              "black": "${settings.black}",
              "text": "${settings.text}",
              "subtext": "${settings.subtext}",
              "hidden": "${settings.hidden}",
              "white": "${settings.white}",
              "red": "${settings.red}",
              "orange": "${settings.orange}",
              "yellow": "${settings.yellow}",
              "green": "${settings.green}",
              "teal": "${settings.teal}",
              "cyan": "${settings.cyan}",
              "blue": "${settings.blue}",
              "purple": "${settings.purple}",
              "pink": "${settings.pink}",
              "brown": "$settings.brown",
              "selection": "#2a2060",
              "comment": "#554f99",
              "accent_dim": "#6962c2"
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
                "background-color": "$purple",
                "bold": true
              },
              "disabled-focused": {
                "color": "$subtext",
                "background-color": "$grey"
              },
              "scrollbar": {
                "color": "$accent_dim",
                "background-color": "$card"
              },
              "timeline-bar": {
                "background-color": "$purple"
              },
              "h1": {
                "color": "$purple",
                "bold": true
              },
              "h2": {
                "color": "$purple",
                "underline": true
              },
              "h3": {
                "color": "$blue",
                "bold": true
              },
              "h4": {
                "color": "$blue",
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
                "color": "$blue",
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
                "color": "$purple",
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
                "color": "$blue",
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
                "color": "$purple",
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
                "background-color": "#2a0d0f"
              },
              "diff-add": {
                "color": "$green",
                "background-color": "#0d2a13"
              },
              "diff-section": {
                "color": "$blue",
                "background-color": "$card",
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
                "color": "$blue",
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
                "background-color": "$purple",
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
                "background-color": "$cyan",
                "bold": true
              },
              "info": {
                "color": "$subtext",
                "background-color": "$card"
              },
              "title-hotkey": {
                "color": "$yellow",
                "background-color": "$purple",
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
                "color": "$blue"
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
