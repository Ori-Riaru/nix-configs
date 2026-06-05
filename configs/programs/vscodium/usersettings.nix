{
  lib,
  settings,
  config,
  ...
}: let
  inherit (lib.strings) splitString;
in {
  programs.vscodium.profiles.default.userSettings = {
    # === Function ===

    "files.autoSave" = "afterDelay";
    "editor.linkedEditing" = true;
    "keyboard.dispatch" = "keyCode";
    "workbench.quickOpen.preserveInput" = false;
    "workbench.editor.defaultBinaryEditor" = "hexEditor.hexedit";
    "editor.smoothScrolling" = true;
    "workbench.list.smoothScrolling" = true;
    "terminal.integrated.smoothScrolling" = true;
    "editor.cursorSmoothCaretAnimation" = "on";
    "explorer.fileNesting.enabled" = true;
    "editor.cursorSurroundingLines" = 20;
    "editor.renderWhitespace" = "trailing";
    "editor.suggestSelection" = "recentlyUsedByPrefix";
    "git.autofetch" = true;
    "gitlens.telemetry.enabled" = false;
    "gitlens.codeLens.enabled" = false;

    "editor.find.seedSearchStringFromSelection" = "never";

    # Formatting
    "editor.defaultFormatter" = "esbenp.prettier-vscode";
    "editor.formatOnSave" = true;
    "editor.formatOnPaste" = true;
    "editor.formatOnType" = true;
    "editor.find.autoFindInSelection" = "multiline";
    "files.autoSaveWhenNoErrors" = true;

    "telemetry.feedback.enabled" = false;

    # === Layout ===

    "window.titleBarStyle" = "native";
    "window.customTitleBarVisibility" = "never";
    "window.customMenuBarAltFocus" = true;
    "workbench.activityBar.location" = "top";
    "window.menuBarVisibility" = "hidden";
    "workbench.statusBar.visible" = false;
    "workbench.secondarySideBar.defaultVisibility" = "hidden";
    "workbench.startupEditor" = "none";
    "workbench.editor.showTabs" = "multiple";
    "breadcrumbs.enabled" = false;
    "editor.minimap.renderCharacters" = false;
    "editor.minimap.side" = "right";
    "editor.minimap.maxColumn" = 80;
    "editor.minimap.scale" = 1;
    "editor.minimap.showSlider" = "always";
    "editor.minimap.autohide" = "mouseover";
    "editor.scrollbar.verticalScrollbarSize" = 10;
    "scm.diffDecorations" = "gutter";
    "workbench.panel.showLabels" = false;
    "diffEditor.experimental.showMoves" = true;
    "editor.rulers" = [
      {
        "column" = 80;
        "color" = "${config.theme.subtext}22";
      }
      {
        "column" = 100;
        "color" = "${config.theme.red}22";
      }
      {
        "column" = 120;
        "color" = "${config.theme.red}33";
      }
    ];

    # Fonts

    "editor.fontLigatures" = true;
    "editor.fontFamily" = "${config.theme.fontMonospace}";
    "terminal.integrated.fontFamily" = "${config.theme.fontMonospace}";
    "editor.lineHeight" = 20;
    "workbench.iconTheme" = "charmed-icons";
    "workbench.productIconTheme" = "material-product-icons";
    "editor.cursorStyle" = "line";
    "terminal.integrated.cursorStyle" = "line";
    "terminal.integrated.cursorStyleInactive" = "none";
    "terminal.integrated.cursorWidth" = 2;
    "editor.fontSize" = 14;
    "debug.console.fontSize" = 14;
    "scm.inputFontSize" = 14;
    "terminal.integrated.fontSize" = 14;
    "chat.editor.fontSize" = 14;
    "markdown.preview.fontSize" = 14;
    "terminal.integrated.fontLigatures" = true;
    "terminal.integrated.minimumContrastRatio" = 5;
    "terminal.integrated.cursorBlinking" = true;

    # Colors

    "workbench.colorTheme" = "Dark 2026";
    "workbench.colorCustomizations" = {
      # === General ===
      "foreground" = config.theme.text;
      "disableForeground" = config.theme.subtext;
      "widget.border" = "#0000";
      "errorForeground" = config.theme.red;
      "button.background" = config.theme.accent;
      "button.hoverBackground" = config.theme.accent;
      "input.background" = config.theme.card;
      "focusBorder" = "#0000";
      "quickInput.background" = config.theme.card;
      "editor.findWidgetBackground" = config.theme.card;
      "editorWidget.background" = config.theme.card;
      "editorStickyScroll.background" = config.theme.section;
      "editorStickyScrollHover.background" = config.theme.section;

      # === Editor ===
      "editor.foreground" = config.theme.text;
      "editor.background" = config.theme.section;
      "editorGutter.background" = config.theme.section;
      "editor.lineHighlightBackground" = config.theme.card;
      "editor.selectionBackground" = "${config.theme.float}";
      "editor.inactiveSelectionBackground" = "${config.theme.float}";
      "editor.selectionForeground" = config.theme.section;
      "editorRuler.foreground" = "${config.theme.orange-dark}";
      "scrollbar.shadow" = "#0000";
      "editorGroup.border" = "#0000";
      "editorCursor.foreground" = config.theme.text;

      "editorLineNumber.foreground" = config.theme.hidden;
      "editorLineNumber.activeForeground" = config.theme.subtext;
      "editorWarning.foreground" = config.theme.orange;
      "editorIndentGuide.background1" = config.theme.hidden;
      "editorIndentGuide.background2" = config.theme.hidden;
      "editorIndentGuide.background3" = config.theme.hidden;
      "editorIndentGuide.background4" = config.theme.hidden;
      "editorIndentGuide.activeBackground1" = config.theme.hidden;
      "editorIndentGuide.activeBackground2" = config.theme.hidden;
      "editorIndentGuide.activeBackground3" = config.theme.hidden;
      "editorIndentGuide.activeBackground4" = config.theme.hidden;

      "editorBracketHighlight.foreground1" = config.theme.text;
      "editorBracketHighlight.foreground2" = config.theme.text;
      "editorBracketHighlight.foreground3" = config.theme.text;
      "editorBracketHighlight.foreground4" = config.theme.text;
      "editorBracketHighlight.foreground5" = config.theme.text;
      "editorBracketHighlight.foreground6" = config.theme.text;
      "editorBracketHighlight.foreground7" = config.theme.text;
      "editorBracketHighlight.foreground8" = config.theme.text;
      "editorBracketHighlight.unmatchedForeground" = config.theme.text;
      "editorWidget.border" = "#0000";
      "tab.border" = "#0000";
      "tab.activeBorderTop" = "#0000";
      "editorGroupHeader.tabsBackground" = "#0000";
      "editorGroupHeader.tabsBorder" = "#0000";
      "tab.activeBackground" = config.theme.overlay;
      "tab.inactiveBackground" = config.theme.section;

      # git status colors
      "editorGutter.addedBackground" = config.theme.teal;
      "editorGutter.deletedBackground" = config.theme.red;
      "editorGutter.modifiedBackground" = config.theme.purple;
      "editorGutter.addedSecondaryBackground" = config.theme.green;
      "editorGutter.modifiedSecondaryBackground" = config.theme.blue;
      "editorGutter.deletedSecondaryBackground" = config.theme.orange;

      "gitDecoration.untrackedResourceForeground" = config.theme.teal;
      "gitDecoration.deletedResourceForeground" = config.theme.red;
      "gitDecoration.modifiedResourceForeground" = config.theme.purple;
      "gitDecoration.addedResourceForeground" = config.theme.green;
      "gitDecoration.stageModifiedResourceForeground" = config.theme.blue;
      "gitDecoration.stagedDeletedResourceForeground" = config.theme.orange;

      # === Side Bar ===

      "sideBar.background" = "${config.theme.section}";

      "sideBarSectionHeader.background" = "${config.theme.section}";
      "sideBarSectionHeader.border" = "#0000";
      "sideBar.foreground" = config.theme.text;

      # Activity Bar

      "activityBar.foreground" = "${config.theme.text}";
      "activityBarBadge.background" = "${config.theme.accent}";

      # Explorer

      "list.errorForeground" = config.theme.red;
      "list.warningForeground" = config.theme.orange;
      "list.hoverBackground" = config.theme.card;

      # Terminal

      "terminal.background" = "${config.theme.section}";
      "terminal.foreground" = "${config.theme.text}";
      "terminalCursor.foreground" = "${config.theme.text}";
      "terminal.ansiBlack" = "${config.theme.base}";
      "terminal.ansiBlue" = "${config.theme.blue}";
      "terminal.ansiCyan" = "${config.theme.cyan}";
      "terminal.ansiGreen" = "${config.theme.teal}";
      "terminal.ansiMagenta" = "${config.theme.purple}";
      "terminal.ansiRed" = "${config.theme.red}";
      "terminal.ansiWhite" = "${config.theme.text}";
      "terminal.ansiYellow" = "${config.theme.orange}";
      "terminal.ansiBrightBlack" = "${config.theme.subtext}";
      "terminal.ansiBrightBlue" = "${config.theme.blue-bright}";
      "terminal.ansiBrightCyan" = "${config.theme.cyan-bright}";
      "terminal.ansiBrightGreen" = "${config.theme.green-bright}";
      "terminal.ansiBrightMagenta" = "${config.theme.purple-bright}";
      "terminal.ansiBrightRed" = "${config.theme.red-bright}";
      "terminal.ansiBrightWhite" = "${config.theme.text}";
      "terminal.ansiBrightYellow" = "${config.theme.yellow}";
    };

    "terminal.integrated.shellIntegration.decorationsEnabled" = "never";
    "terminal.integrated.shellIntegration.enabled" = false;

    # === Syntax Highlighting ===

    # "editor.tokenColorCustomizations" = {
    #   # Strings
    #   # Numbers / Constants

    #   "textMateRules" = [
    #     {
    #       "name" = "Default";
    #       scope = [
    #         ""
    #         "support.type.property-name.json"
    #         "meta.attribute.unrecognized"
    #         "support.type.property-name.css"
    #         "meta.field.declaration"
    #         "meta.template.expression"
    #         "entity.other.attribute-name"
    #       ];
    #       "settings" = {
    #         "foreground" = config.theme.text;
    #       };
    #     }

    #     {
    #       "name" = "comments";
    #       "scope" = ["comment"];
    #       "settings" = {
    #         "foreground" = config.theme.green;
    #       };
    #     }

    #     {
    #       "name" = "string";
    #       "scope" = [
    #         "string"
    #         "string.quoted.single"
    #         "string.quoted.double"
    #         "string.template"
    #         "punctuation.definition.string.template"
    #         "variable.parameter.url.css"
    #         "string.quoted.other.nix"
    #       ];
    #       "settings" = {
    #         "foreground" = config.theme.purple;
    #       };
    #     }

    #     {
    #       "name" = "number";
    #       "scope" = [
    #         "constant.numeric"
    #         "constant.language"
    #         "keyword.other.unit"
    #         "constant.other.color.rgb-value.hex"
    #       ];
    #       "settings" = {
    #         "foreground" = config.theme.blue;
    #       };
    #     }

    #     {
    #       "name" = "Keywords";
    #       "scope" = [
    #         "keyword.control"
    #         "keyword.operator"
    #         "variable.language"
    #         "constant.language"
    #         "storage.modifier"
    #         "entity.other.ng-binding-name.template.html"
    #         "source.css meta.property-value"
    #         "string.regexp"
    #         "punctuation.definition.template-expression.begin"
    #         "support.type.object.module"
    #         "punctuation.separator.statement.and.shell"
    #       ];
    #       "settings" = {
    #         "foreground" = config.theme.orange;
    #       };
    #     }

    #     {
    #       "name" = "function";
    #       "scope" = [
    #         "storage.type"
    #         "meta.definition.method"
    #         "meta.definition.function"
    #         "entity.name.type.class"
    #         "meta.function-call"
    #         "entity.name.tag"
    #         "entity.name.tag"
    #         "entity.other.attribute-name.id.css"
    #         "entity.other.attribute-name.class.css"
    #         "meta.at-rule.keyframes"
    #         "support.function.misc"
    #         "support.class.component"
    #         "support.function.builtin.shell"
    #         "entity.name.command.shell"
    #       ];
    #       "settings" = {
    #         "foreground" = config.theme.green;
    #       };
    #     }

    #     {
    #       "name" = "Keyword";
    #       "scope" = [
    #         "source.css punctuation.definition.keyword"
    #         "source.css keyword"
    #         "entity.name.tag.reference"
    #         "keyword.other.important"
    #         "string.unquoted.heredoc.expanded.shell"
    #         "keyword.control.at-rule"
    #         "punctuation.definition.tag.end"
    #         "punctuation.definition.tag.begin"
    #       ];
    #       "settings" = {
    #         "foreground" = config.theme.pink;
    #       };
    #     }
    #     {
    #       "name" = "types";
    #       "scope" = [
    #         "entity.name.type"
    #         "support.type.primitive"
    #         "meta.interface"
    #         "storage.type.class.jsdoc"
    #         "variable.other.normal.shell"
    #         "variable.parameter.positional.shell"
    #         "variable.other.assignment.shell"
    #         "support.type.builtin"
    #       ];
    #       "settings" = {
    #         "foreground" = config.theme.blue;
    #       };
    #     }
    #   ];
    # };

    # Extension settings
    "extensions.autoUpdate" = false;

    "cSpell.userWords" =
      [
        # === Generic ===

        "deadname"
        "rgba"
        "substituters"
        "smarthome"
        "Activatable"
        "Shinigami"
        "shinigami"
        "autohide"
        "USERPROFILE"
        "urlbar"
        "favourite"
        "tweening"
        "colour"

        # === Names ===

        settings.username
        settings.usernameFull
        settings.email
        "riaru"
        "aki"
        "Pharr"
        "Jakob"
        "abenz"
        "ajay"
        "rycee"

        # === Language Specific ===

        # Web Tech
        "onclick"
        "oninput"

        # Nix
        "direnv"
        "nixos"
        "pkgs"
        "nixpkgs"
        "cachix"
        "stdenv"
        "pname"
        "fetchurl"
        "tmpfiles"
        "stylix"
        "homemanager"
        "statix"
        "autofetch"
        "automount"
        "bootnext"

        # OpenGL
        "tinyobjloader"
        "glfw"
        "glew"
        "openexr"
        "pbrt"
        "cropwindow"
        "opengl"
        "glsl"
        "preproc"

        # Python
        "numpy"
        "matplotlib"
        "seaborn"
        "tqdm"
        "pytest"
        "ipython"
        "ipynb"
        "jupyterlab"
        "tidyverse"
        "torchtext"
        "torchvision"
        "pycache"
        "venv"
        "venvs"
        "virtualenv"
        "kernelspec"

        # R
        "ggplot"
        "xlab"
        "ylab"

        # Kanata / kbd
        "kanata"
        "defchordsv"
        "deflayer"
        "deflayermap"
        "defoverrides"
        "defsrc"
        "deftemplate"
        "defvar"
        "defvirtualkeys"
        "defalias"
        "keybind"
        "keybinds"
        "keyhold"
        "keytap"
        "homerowmod"
        "homerowmodfilter"
        "timeouthold"
        "timeouttap"
        "nocaps"
        "lalt"
        "ralt"
        "lctl"
        "lctrl"
        "rctl"
        "lmet"
        "rmet"
        "lsft"
        "rsft"
        "vkey"
        "gesc"
        "pgdn"
        "pgup"

        # Rust
        "tauri"

        # === Program / Application Specific ===

        # Apps
        "niri"
        "spicetify"

        # Websites
        "csrinru"
        "nixoswiki"
        "nixwiki"
        "Newegg"
        "phtn"
        "protondb"
        "steamdb"
        "monkeytype"
        "windscribe"
        "miru"
        "Miruro"
        "Anilist"
        "alternativeto"
        "bitwarden"
        "Bitwarden"
        "onlinefix"
        "Ovagames"
        "Lemmy"
        "Jellyfin"

        # Games
        "Enigmatica"
        "hytale"

        # Walker
        "niriactions"
        "nirisessions"

        # KDE
        "karousel"
        "krohnkite"
        "kwin"
        "Kwin"
        "kwinrc"
        "krunner"
        "Krunner"
        "krunnerrc"
        "kscreenlocker"
        "ksmserverrc"
        "ksplashrc"
        "klaunchrc"
        "kdeglobals"
        "kcminputrc"
        "kxkbrc"
        "konsole"
        "kdeconnect"
        "systemsettings"
        "systemsettingsrc"
        "powerdevil"
        "plasmusic"
        "baloosearch"
        "desktopapplications"
        "bookmarksrunner"
        "contactsmenu"

        # Firefox
        "userchrome"
        "firefoxpwa"
        "pwas"
        "newtaboverride"
        "newtab"
        "newtabpage"
        "tabbrowser"
        "tabbar"
        "tabpanels"
        "browsertabs"
        "typeaheadfind"
        "formautofill"
        "healthreport"
        "contentarea"
        "gamemode"
        "gamenum"
        "gametype"
        "urlbar"
        "alltabs"
        "shinigamieyes"
        "agenedia"
        "automail"
        "darkreader"
        "dearrow"
        "enhancerforyoutube"
        "fastforward"
        "fastforwardteam"
        "filips"
        "guus"
        "idcac"
        "infy"
        "Infy"
        "istilldontcareaboutcookies"
        "jetpack"
        "joolee"
        "maximerf"
        "ninetailed"
        "raymondhill"
        "redirector"
        "Redirector"
        "Scroller"
        "sidebery"
        "Sidebery"
        "sponsorblock"
        "sponsorblocker"
        "tampermonkey"
        "Tampermonkey"
        "ublock"
        "VAFA"
        "videocontrols"
        "wayback"
        "Wayback"
        "windscribeff"

        # Nautilus
        "lzma"
        "tarz"
        "zstd"

        # Vscode
        "hexedit"
      ]
      ++ (map (package: package.pname or package.name or "") (config.home.packages))
      ++ (map (package: package.pname or package.name or "") (config.home.packages or []))
      ++ (
        map
        (extension: extension.name or "")
        config.programs.firefox.profiles.${settings.username}.extensions.packages
      )
      ++ (
        map
        (extension: extension.vscodeExtPublisher)
        (config.programs.vscode.profiles.default.extensions or [])
      )
      # ++ (
      #   map
      #   (extension: extension.vscodeExtName)
      #   (config.programs.vscode.profiles.default.extensions or [])
      # )
      ++ (
        splitString "\n" (builtins.readFile ./lorem.txt)
      );

    "highlightOnCopy.backgroundColor" = "${config.theme.accent}33";
    "highlightOnCopy.foregroundColor" = config.theme.text;

    "color-highlight.matchRgbWithNoFunction" = true;
    "color-highlight.matchWords" = true;
    "color-highlight.markRuler" = false;

    "terminal.integrated.env.linux" = {};
    "autoHidePlus.autoHideLeftSideBar" = true;
    "search.quickOpen.includeHistory" = false;

    "console-ninja.featureSet" = "Community";
    "console-ninja.toolsToEnableSupportAutomaticallyFor" = {
      "live-server-extension" = true;
      "live-preview-extension" = true;
    };

    "redhat.telemetry.enabled" = false;
    "chat.disableAIFeatures" = false;
    "direnv.restart.automatic" = true;

    # Git Lens
    "gitlens.currentLine.pullRequests.enabled" = false;
    "gitlens.currentLine.enabled" = false;

    # Error Lens
    "errorLens.errorForeground" = "${config.theme.red}";
    "errorLens.errorBackground" = "${config.theme.red}33";

    "errorLens.warningBackground" = "${config.theme.orange}33";
    "errorLens.warningForeground" = "${config.theme.orange}";

    "errorLens.enabled" = true;
    "errorLens.codeLensEnabled" = false;
    "editor.codeLensFontFamily" = "JetBrainsMono Nerd Font";
    "editor.codeLensFontSize" = 14;
    "errorLens.severityText" = ["" "" "" ""];
    "errorLens.codeLensTemplate" = "$severity $message";
    "errorLens.messageTemplate" = "$message";
    "errorLens.onSaveUpdateOnActiveEditorChange" = true;

    "errorLens.delay" = 1000;

    # Markdown
    "markdown.extension.completion.enabled" = false;
    "markdown.extension.tableFormatter.enabled" = false;
    "markdownInline.showCheckboxCodeLens" = false;
    "markdown-preview-enhanced.previewTheme" = "vscode.css";

    # Python
    "[python]" = {
      "editor.defaultFormatter" = "charliermarsh.ruff";
    };

    # Stylelint
    "stylelint.enable" = true;
    "stylelint.configFile" = "${config.home.homeDirectory}/.stylelintrc.json";
    "stylelint.stylelintPath" = "${config.home.homeDirectory}/.npm-global/lib/node_modules/stylelint";
    "stylelint.configBasedir" = "${config.home.homeDirectory}/.npm-global/lib/node_modules";
    "stylelint.validate" = ["css" "postcss" "scss" "less"];

    "editor.codeActionsOnSave" = {
      "source.fixAll.stylelint" = "explicit";
    };

    # R
    "[R]" = {
      "editor.defaultFormatter" = "REditorSupport.r";
    };
    "r.lsp.promptToInstall" = false;

    "[rmd]" = {
      "editor.defaultFormatter" = "REditorSupport.r";
    };

    # cpp
    "clang-format.fallbackStyle" = "Google";
    "[cpp]" = {
      "editor.defaultFormatter" = "xaver.clang-format";
    };

    # Svelte
    "svelte.enable-ts-plugin" = true;
    "[svelte]" = {
      "editor.defaultFormatter" = "svelte.svelte-vscode";
    };

    # css
    "css.validate" = false;
    "scss.validate" = false;
    "[css][scss]" = {
      "editor.defaultFormatter" = "stylelint.vscode-stylelint";
    };

    "[rust]" = {
      "editor.defaultFormatter" = "rust-lang.rust-analyzer";
    };

    "[typescriptreact]" = {
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
    };

    # Typescript
    "ts/js.inlayHints.parameterNames.enabled" = "all";
    "ts/js.inlayHints.parameterTypes.enabled" = true;
    "ts/js.inlayHints.variableTypes.enabled" = true;
    "ts/js.inlayHints.propertyDeclarationTypes.enabled" = true;
    "ts/js.inlayHints.functionLikeReturnTypes.enabled" = true;
    "ts/js.inlayHints.enumMemberValues.enabled" = true;

    # javascript
    "js/ts.inlayHints.enumMemberValues.enabled" = true;
    "js/ts.inlayHints.functionLikeReturnTypes.enabled" = true;
    "js/ts.inlayHints.parameterNames.enabled" = "all";
    "js/ts.inlayHints.parameterTypes.enabled" = true;
    "js/ts.inlayHints.propertyDeclarationTypes.enabled" = true;
    "js/ts.inlayHints.variableTypes.enabled" = true;

    # Go
    "[go]" = {
      "editor.defaultFormatter" = "golang.go";
    };

    "go.inlayHints.assignVariableTypes" = true;
    "go.inlayHints.compositeLiteralFields" = true;
    "go.inlayHints.compositeLiteralTypes" = true;
    "go.inlayHints.constantValues" = true;
    "go.inlayHints.functionTypeParameters" = true;
    "go.inlayHints.parameterNames" = true;
    "go.inlayHints.rangeVariableTypes" = true;

    # Nix
    "[nix]" = {
      "editor.defaultFormatter" = "kamadorueda.alejandra";
      "editor.formatOnPaste" = true;
      "editor.formatOnSave" = true;
      "editor.formatOnType" = true;
    };

    "alejandra.program" = "alejandra";

    "nixEnvSelector.suggestion" = false;

    "nix.serverPath" = "nixd";
    "nix.enableLanguageServer" = true;
    "nix.serverSettings" = {
      "nixd" = {
        "options" = {
          "nixpkgs" = {
            "expr" = "import (builtins.getFlake \"/mnt/nfs/${settings.username}/Projects/nix-configs/\").inputs.nixpkgs { }";
          };
          "home-manager" = {
            "expr" = "(builtins.getFlake \"/mnt/nfs/${settings.username}/Projects/nix-configs/\").homeConfigurations.\"${settings.username}@lain\".options";
          };
          "nixos" = {
            "expr" = "(builtins.getFlake \"/mnt/nfs/${settings.username}/Projects/nix-configs/\").nixosConfigurations.lain.options";
          };
        };
      };
    };
  };
}
