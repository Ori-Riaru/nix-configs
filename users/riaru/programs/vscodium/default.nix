{
  pkgs,
  settings,
  ...
}: {
  home.packages = with pkgs; [
    direnv
  ];

  imports = [
    ./extensions.nix
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    mutableExtensionsDir = false;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;

    userSettings = {
      "files.autoSave" = "afterDelay";
      "editor.wordWrap" = "on";
      "editor.linkedEditing" = true;

      "workbench.editor.defaultBinaryEditor" = "hexEditor.hexedit";

      # Formatting
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "[c][cpp]" = {
        "editor.defaultFormatter" = "llvm-vs-code-extensions.vscode-clangd";
      };
      "editor.formatOnSave" = true;
      "editor.formatOnPaste" = true;
      "editor.formatOnType" = true;
      "editor.find.autoFindInSelection" = "multiline";
      "files.autoSaveWhenNoErrors" = true;

      # Fonts
      "editor.fontLigatures" = true;
      "editor.fontFamily" = "${settings.font-monospace}";
      "terminal.integrated.fontFamily" = "${settings.font-monospace}";
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
      "workbench.sideBar.location" = "right";
      "workbench.activityBar.location" = "top";
      "window.menuBarVisibility" = "hidden";
      "workbench.statusBar.visible" = false;
      "workbench.editor.showTabs" = "none";
      "breadcrumbs.enabled" = false;
      "editor.minimap.renderCharacters" = false;
      "editor.scrollbar.verticalScrollbarSize" = 0;
      "scm.diffDecorations" = "gutter";
      "workbench.panel.showLabels" = false;

      # Colors
      "workbench.colorTheme" = "Visual Studio Dark";
      "workbench.colorCustomizations" = {
        # General
        "foreground" = "${settings.text}";
        "disableForeground" = "${settings.text}";
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
        "errorLens.errorForeground" = "${settings.red}";
        "errorLens.errorBackground" = "${settings.red}33";

        "errorLens.warningBackground" = "${settings.orange}33";
        "errorLens.warningForeground" = "${settings.orange}";

        # Auto complete popup
        "editorWidget.border" = "#0000";

        # Git added an removed colors
        "editorGutter.addedBackground" = "${settings.teal}";
        "editorGutter.deletedBackground" = "${settings.red}";
        "editorGutter.modifiedBackground" = "${settings.purple}";

        "editorBracketHighlight.foreground1" = "${settings.accent}";
        "editorBracketHighlight.foreground2" = "${settings.secondary}";
        "editorBracketHighlight.foreground3" = "${settings.tertiary}";
        "editorBracketHighlight.foreground4" = "${settings.yellow}";
        "editorBracketHighlight.foreground5" = "${settings.teal}";
        "editorBracketHighlight.foreground6" = "${settings.orange}";
        "editorBracketHighlight.unmatchedForeground" = "${settings.red}";

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

      # # Syntax Highlighting
      # "editor.tokenColorCustomizations" = {
      #   "textMateRules" = [
      # {
      #   "name" = "Default";
      #   "scope" = [
      #     ""
      #     "support.type.property-name.json"
      #     "meta.attribute.unrecognized"
      #     "support.type.property-name.css"
      #     "meta.field.declaration"
      #     "meta.template.expression"
      #   ];
      #   "settings" = {
      #     "foreground" = "${settings.text}";
      #   };
      # }

      # {
      #   "name" = "comments";
      #   "scope" = ["comment"];
      #   "settings" = {
      #     "foreground" = "${settings.subtext}";
      #   };
      # }

      # {
      #   "name" = "string";
      #   "scope" = [
      #     "string.quoted.single"
      #     "string.quoted.double"
      #     "string.template"
      #     "punctuation.definition.string.template"
      #     "variable.parameter.url.css"
      #     "string.quoted.other.nix"
      #   ];
      #   "settings" = {
      #     "foreground" = "#a080ff";
      #   };
      # }

      # {
      #   "name" = "number";
      #   "scope" = [
      #     "constant.numeric"
      #     "keyword.other.unit"
      #     "constant.other.color.rgb-value.hex"
      #   ];
      #   "settings" = {
      #     "foreground" = "#FFA062";
      #   };
      # }

      # {
      #   "name" = "Keywords";
      #   "scope" = [
      #     "keyword.control"
      #     "keyword.operator"
      #     "variable.language"
      #     "constant.language"
      #     "storage.modifier"
      #     "entity.other.ng-binding-name.template.html"
      #     "source.css meta.property-value"
      #     "string.regexp"
      #     "punctuation.definition.template-expression.begin"
      #     "support.type.object.module"
      #     "punctuation.separator.statement.and.shell"
      #   ];
      #   "settings" = {
      #     "foreground" = "#8BF9FF";
      #   };
      # }

      # {
      #   "name" = "function";
      #   "scope" = [
      #     "storage.type"
      #     "meta.definition.method"
      #     "meta.definition.function"
      #     "entity.name.type.class"
      #     "meta.function-call"
      #     "entity.name.tag"
      #     "entity.name.tag"
      #     "entity.other.attribute-name.id.css"
      #     "entity.other.attribute-name.class.css"
      #     "meta.at-rule.keyframes"
      #     "support.function.misc"
      #     "support.class.component"
      #     "support.function.builtin.shell"
      #     "entity.name.command.shell"
      #   ];
      #   "settings" = {
      #     "foreground" = "#61FFB3";
      #   };
      # }

      # {
      #   "name" = "Keyword";
      #   "scope" = [
      #     "source.css punctuation.definition.keyword"
      #     "source.css keyword"
      #     "entity.name.tag.reference"
      #     "keyword.other.important"
      #     "string.unquoted.heredoc.expanded.shell"
      #     "keyword.control.at-rule"
      #     "punctuation.definition.tag.end"
      #     "punctuation.definition.tag.begin"
      #   ];
      #   "settings" = {
      #     "foreground" = "#FFA6FE";
      #   };
      # }
      # {
      #   "name" = "types";
      #   "scope" = [
      #     "entity.name.type"
      #     "support.type.primitive"
      #     "meta.interface"
      #     "storage.type.class.jsdoc"
      #     "variable.other.normal.shell"
      #     "variable.parameter.positional.shell"
      #     "variable.other.assignment.shell"
      #     "support.type.builtin"
      #   ];
      #   "settings" = {
      #     "foreground" = "#80B9FF";
      #   };
      # }
      #   ];
      # };

      # Extension settings
      "cSpell.userWords" = [
        "${settings.username}"
        "${settings.username-full}"
        "riaru"
        "aki"
        "shizuku"
        "nixpkgs"
        "nixos"
        "pkgs"
      ];

      "highlightOnCopy.backgroundColor" = "${settings.secondary}";
      "highlightOnCopy.foregroundColor" = "#fff";

      "color-highlight.matchRgbWithNoFunction" = true;
      "color-highlight.matchWords" = true;

      "terminal.integrated.env.linux" = {};

      "console-ninja.featureSet" = "Community";
      "console-ninja.toolsToEnableSupportAutomaticallyFor" = {
        "live-server-extension" = true;
        "live-preview-extension" = true;
      };

      "redhat.telemetry.enabled" = false;

      # Nix

      "[nix]" = {
        "editor.defaultFormatter" = "kamadorueda.alejandra";
        "editor.formatOnPaste" = true;
        "editor.formatOnSave" = true;
        "editor.formatOnType" = false;
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
          "expr" = "(builtins.getFlake \"/home/${settings.username}/Projects/nix-configs/\").homeConfigurations.${settings.username}@shizuku.options";
        };
        "nixos" = {
          "expr" = "(builtins.getFlake \"/home/${settings.username}/Projects/nix-configs/\").nixosConfigurations.shizuku.options";
        };
      };
    };
  };
}
