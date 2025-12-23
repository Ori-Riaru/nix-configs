{
  settings,
  config,
  ...
}: {
  programs.vscode.profiles.default.userSettings = {
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
    "editor.cursorSurroundingLines" = 100;
    "editor.renderWhitespace" = "trailing";
    "editor.suggestSelection" = "recentlyUsedByPrefix";
    "git.autofetch" = true;
    "gitlens.telemetry.enabled" = false;

    # Formatting
    "editor.defaultFormatter" = "prettier.prettier-vscode";
    "editor.formatOnSave" = true;
    "editor.formatOnPaste" = true;
    "editor.formatOnType" = true;
    "editor.find.autoFindInSelection" = "multiline";
    "files.autoSaveWhenNoErrors" = true;

    # Fonts

    "editor.fontLigatures" = true;
    "editor.fontFamily" = "${settings.fontMonospace}";
    "terminal.integrated.fontFamily" = "${settings.fontMonospace}";
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

    # Layout

    "window.titleBarStyle" = "native";
    "window.customTitleBarVisibility" = "never";
    "workbench.activityBar.location" = "top";
    "window.menuBarVisibility" = "hidden";
    "workbench.statusBar.visible" = false;
    "workbench.editor.showTabs" = "single";
    "breadcrumbs.enabled" = false;
    "editor.minimap.renderCharacters" = false;
    "editor.minimap.side" = "left";
    "editor.minimap.maxColumn" = 80;
    "editor.minimap.scale" = 1;
    "editor.minimap.showSlider" = "always";
    "editor.scrollbar.verticalScrollbarSize" = 0;
    "scm.diffDecorations" = "gutter";
    "workbench.panel.showLabels" = false;
    "diffEditor.experimental.showMoves" = true;

    # Colors

    "workbench.colorTheme" = "Visual Studio Dark";
    "workbench.colorCustomizations" = {
      # General

      "foreground" = "${settings.text}";
      "disableForeground" = "${settings.subtext}";
      "widget.border" = "#0000";
      "errorForeground" = "${settings.red}";
      "button.background" = "${settings.accent}";
      "button.hoverBackground" = "${settings.accent}";
      "input.background" = "${settings.card}";
      "focusBorder" = "#0000";

      # Editor

      "editor.foreground" = "${settings.text}";
      "editor.background" = "${settings.section}";
      "editor.lineHighlightBackground" = "${settings.card}";
      "editor.selectionBackground" = "${settings.accent}";
      "editor.selectionForeground" = "${settings.text}";

      "editorCursor.foreground" = "${settings.text}";
      "editorLineNumber.foreground" = "${settings.subtext}";
      "scrollbar.shadow" = "#0000";
      "editorGroup.border" = "#0000";

      "editorWarning.foreground" = "${settings.orange}";

      # Auto complete popup

      "editorWidget.border" = "#0000";

      # Git added an removed colors

      "editorGutter.addedBackground" = "${settings.teal}";
      "editorGutter.deletedBackground" = "${settings.red}";
      "editorGutter.modifiedBackground" = "${settings.purple}";

      "editorBracketHighlight.foreground1" = "${settings.text}";
      "editorBracketHighlight.foreground2" = "${settings.subtext}";
      "editorBracketHighlight.foreground3" = "${settings.hidden}";
      "editorBracketHighlight.foreground4" = "${settings.text}";
      "editorBracketHighlight.foreground5" = "${settings.subtext}";
      "editorBracketHighlight.foreground6" = "${settings.hidden}";
      "editorBracketHighlight.foreground7" = "${settings.hidden}";
      "editorBracketHighlight.foreground8" = "${settings.hidden}";
      "editorBracketHighlight.unmatchedForeground" = "${settings.text}";

      # Side Bar

      "sideBar.background" = "${settings.section}";

      "sideBarSectionHeader.background" = "${settings.section}";
      "sideBarSectionHeader.border" = "#0000";
      "sideBar.foreground" = "#FFFFFF";

      # Activity Bar

      "activityBar.foreground" = "${settings.text}";
      "activityBarBadge.background" = "${settings.accent}";

      # Explorer

      "list.errorForeground" = "${settings.red}";
      "list.warningForeground" = "${settings.orange}";
      "list.hoverBackground" = "${settings.card}";

      "gitDecoration.deletedResourceForeground" = "${settings.red}";
      "gitDecoration.modifiedResourceForeground" = "${settings.purple}";
      "gitDecoration.untrackedResourceForeground" = "${settings.teal}";

      # Terminal

      "terminal.background" = "${settings.section}";
      "terminal.foreground" = "${settings.text}";
      "terminalCursor.foreground" = "${settings.text}";
      "terminal.ansiBlack" = "${settings.black}";
      "terminal.ansiBlue" = "${settings.blue}";
      "terminal.ansiCyan" = "${settings.cyan}";
      "terminal.ansiGreen" = "${settings.teal}";
      "terminal.ansiMagenta" = "${settings.purple}";
      "terminal.ansiRed" = "${settings.red}";
      "terminal.ansiWhite" = "${settings.white}";
      "terminal.ansiYellow" = "${settings.orange}";
      "terminal.ansiBrightBlack" = "${settings.subtext}";
      "terminal.ansiBrightBlue" = "#ACD1FF";
      "terminal.ansiBrightCyan" = "#B9F7FF";
      "terminal.ansiBrightGreen" = "${settings.green}";
      "terminal.ansiBrightMagenta" = "#ADA0FF";
      "terminal.ansiBrightRed" = "#FF5271";
      "terminal.ansiBrightWhite" = "${settings.white}";
      "terminal.ansiBrightYellow" = "${settings.yellow}";
    };

    "terminal.integrated.shellIntegration.decorationsEnabled" = "never";
    "terminal.integrated.shellIntegration.enabled" = false;

    # Syntax Highlighting

    "editor.tokenColorCustomizations" = {
      # Strings
      # Numbers / Constants

      "textMateRules" = [
        {
          "name" = "Default";
          scope = [
            ""
            "support.type.property-name.json"
            "meta.attribute.unrecognized"
            "support.type.property-name.css"
            "meta.field.declaration"
            "meta.template.expression"
            "entity.other.attribute-name"
          ];
          "settings" = {
            "foreground" = settings.text;
          };
        }

        {
          "name" = "comments";
          "scope" = ["comment"];
          "settings" = {
            "foreground" = settings.green;
          };
        }

        {
          "name" = "string";
          "scope" = [
            "string"
            "string.quoted.single"
            "string.quoted.double"
            "string.template"
            "punctuation.definition.string.template"
            "variable.parameter.url.css"
            "string.quoted.other.nix"
          ];
          "settings" = {
            "foreground" = settings.purple;
          };
        }

        {
          "name" = "number";
          "scope" = [
            "constant.numeric"
            "constant.language"
            "keyword.other.unit"
            "constant.other.color.rgb-value.hex"
          ];
          "settings" = {
            "foreground" = settings.blue;
          };
        }

        {
          "name" = "Keywords";
          "scope" = [
            "keyword.control"
            "keyword.operator"
            "variable.language"
            "constant.language"
            "storage.modifier"
            "entity.other.ng-binding-name.template.html"
            "source.css meta.property-value"
            "string.regexp"
            "punctuation.definition.template-expression.begin"
            "support.type.object.module"
            "punctuation.separator.statement.and.shell"
          ];
          "settings" = {
            "foreground" = settings.orange;
          };
        }

        {
          "name" = "function";
          "scope" = [
            "storage.type"
            "meta.definition.method"
            "meta.definition.function"
            "entity.name.type.class"
            "meta.function-call"
            "entity.name.tag"
            "entity.name.tag"
            "entity.other.attribute-name.id.css"
            "entity.other.attribute-name.class.css"
            "meta.at-rule.keyframes"
            "support.function.misc"
            "support.class.component"
            "support.function.builtin.shell"
            "entity.name.command.shell"
          ];
          "settings" = {
            "foreground" = "#61FFB3";
          };
        }

        {
          "name" = "Keyword";
          "scope" = [
            "source.css punctuation.definition.keyword"
            "source.css keyword"
            "entity.name.tag.reference"
            "keyword.other.important"
            "string.unquoted.heredoc.expanded.shell"
            "keyword.control.at-rule"
            "punctuation.definition.tag.end"
            "punctuation.definition.tag.begin"
          ];
          "settings" = {
            "foreground" = "#FFA6FE";
          };
        }
        {
          "name" = "types";
          "scope" = [
            "entity.name.type"
            "support.type.primitive"
            "meta.interface"
            "storage.type.class.jsdoc"
            "variable.other.normal.shell"
            "variable.parameter.positional.shell"
            "variable.other.assignment.shell"
            "support.type.builtin"
          ];
          "settings" = {
            "foreground" = "#80B9FF";
          };
        }
      ];
    };

    # Extension settings
    "extensions.autoUpdate" = false;

    "cSpell.userWords" = [
      "${settings.username}"
      "${settings.usernameFull}"
      "riaru"
      "aki"
      "nixpkgs"
      "rgba"
      "nixos"
      "pkgs"
      "direnv"
    ];

    "highlightOnCopy.backgroundColor" = "${settings.secondary}";
    "highlightOnCopy.foregroundColor" = "#fff";

    "color-highlight.matchRgbWithNoFunction" = true;
    "color-highlight.matchWords" = true;

    "terminal.integrated.env.linux" = {};
    "autoHidePlus.autoHideLeftSideBar" = true;
    "search.quickOpen.includeHistory" = false;

    "console-ninja.featureSet" = "Community";
    "console-ninja.toolsToEnableSupportAutomaticallyFor" = {
      "live-server-extension" = true;
      "live-preview-extension" = true;
    };

    "redhat.telemetry.enabled" = false;

    "direnv.restart.automatic" = true;
    # Error Lens

    "errorLens.errorForeground" = "${settings.red}";
    "errorLens.errorBackground" = "${settings.red}33";

    "errorLens.warningBackground" = "${settings.orange}33";
    "errorLens.warningForeground" = "${settings.orange}";

    "errorLens.enabled" = true;
    "errorLens.codeLensEnabled" = true;
    "editor.codeLensFontFamily" = "JetBrainsMono Nerd Font";
    "editor.codeLensFontSize" = 14;
    "errorLens.severityText" = ["" "" "" ""];
    "errorLens.codeLensTemplate" = "$severity $message";
    "errorLens.messageTemplate" = " ";
    "errorLens.onSaveUpdateOnActiveEditorChange" = true;

    "errorLens.delay" = 1000;

    # Stylelint

    "stylelint.enable" = true;
    "stylelint.configFile" = "${config.home.homeDirectory}/.stylelintrc.json";
    "stylelint.stylelintPath" = "${config.home.homeDirectory}/.npm-global/lib/node_modules/stylelint";
    "stylelint.configBasedir" = "${config.home.homeDirectory}/.npm-global/lib/node_modules";
    "stylelint.validate" = ["css" "postcss" "scss" "less"];

    "editor.codeActionsOnSave" = {
      "source.fixAll.stylelint" = "explicit";
    };

    # cpp

    "[c][cpp]" = {
      "editor.defaultFormatter" = "llvm-vs-code-extensions.vscode-clangd";
    };

    # Svelte

    "svelte.enable-ts-plugin" = true;
    "[svelte]" = {
      "editor.defaultFormatter" = "svelte.svelte-vscode";
    };

    # css

    "[css][scss]" = {
      "editor.defaultFormatter" = "prettier.prettier-vscode";
    };

    # Typescript

    "typescript.inlayHints.parameterNames.enabled" = "all";
    "typescript.inlayHints.parameterTypes.enabled" = true;
    "typescript.inlayHints.variableTypes.enabled" = true;
    "typescript.inlayHints.propertyDeclarationTypes.enabled" = true;
    "typescript.inlayHints.functionLikeReturnTypes.enabled" = true;
    "typescript.inlayHints.enumMemberValues.enabled" = true;

    # javascript

    "javascript.inlayHints.parameterNames.enabled" = "all";
    "javascript.inlayHints.parameterTypes.enabled" = true;
    "javascript.inlayHints.variableTypes.enabled" = true;
    "javascript.inlayHints.propertyDeclarationTypes.enabled" = true;
    "javascript.inlayHints.functionLikeReturnTypes.enabled" = true;

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
    "nixpkgs" = {
      "expr" = "import <nixpkgs> {}";
    };

    "options" = {
      "home_manager" = {
        "expr" = "(builtins.getFlake \"/home/${settings.username}/Projects/nix-configs/\").homeConfigurations.${settings.username}@slate.options";
      };
      "nixos" = {
        "expr" = "(builtins.getFlake \"/home/${settings.username}/Projects/nix-configs/\").nixosConfigurations.slate.options";
      };
      "niri" = {
        "expr" = "(builtins.getFlake \"/home/${settings.username}/Projects/nix-configs/\").inputs.niri.homeModules.niri.options";
      };
      "stylix" = {
        "expr" = "(builtins.getFlake \"/home/${settings.username}/Projects/nix-configs/\").inputs.stylix.homeManagerModules.stylix.options";
      };
      "spicetify" = {
        "expr" = "(builtins.getFlake \"/home/${settings.username}/Projects/nix-configs/\").inputs.spicetify-nix.homeManagerModules.default.options";
      };
      "plasma-manager" = {
        "expr" = "(builtins.getFlake \"/home/${settings.username}/Projects/nix-configs/\").inputs.plasma-manager.homeManagerModules.plasma-manager.options";
      };
    };
  };
}
