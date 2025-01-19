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
      "editor.formatOnSave" = true;
      "editor.formatOnPaste" = true;

      "[css][scss][less][jsonc][javascript][typescript][html]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };

      "nix.serverPath" = "nixd";
      "nix.enableLanguageServer" = true;
      "nixpkgs" = {
        "expr" = "import <nixpkgs> {}";
      };

      "formatting" = {
        "command" = ["alejandra"];
      };

      "options" = {
        "home_manager" = {
          "expr" = "(builtins.getFlake \"/home/${settings.username}/Projects/nix-configs/\").homeConfigurations.${settings.username}@shizuku.options";
        };
        "nixos" = {
          "expr" = "(builtins.getFlake \"/home/${settings.username}/Projects/nix-configs/\").nixosConfigurations.shizuku.options";
        };
      };

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

      "editor.fontLigatures" = true;
      "editor.fontFamily" = "JetbrainsMono Nerd Font";

      "apc.parts.font.family" = {
        "activityBar" = "Inter";
        "extension-editor" = "Inter";
        "monaco-menu" = "Inter";
        "panel" = "Inter";
        "settings-body" = "Inter";
        "sidebar" = "Inter";
        "statusbar" = "Inter";
        "tabs" = "Inter";
        "titlebar" = "Inter";
      };

      "workbench.iconTheme" = "charmed-icons";
      "workbench.productIconTheme" = "material-product-icons";

      # Hide Elements
      "window.menuBarVisibility" = "hidden";
      "symbols.hidesExplorerArrows" = true;

      "breadcrumbs.enabled" = false;
      "workbench.editor.showTabs" = "single";
      "workbench.statusBar.visible" = false;

      "window.customTitleBarVisibility" = "never";
      "window.titleBarStyle" = "native";

      "editor.minimap.renderCharacters" = false;
      "editor.scrollbar.verticalScrollbarSize" = 0;

      "apc.stylesheet" = {
        # Sidebar #
        # Remove Unnecessary padding
        ".monaco-workbench .part>.title>.title-label" = "padding-left: 0px !important;";
        ".open-editors .monaco-list .monaco-list-row" = "padding-left: 0px !important";
        # Minimize scroll in open editors
        ".composite.viewlet.explorer-viewlet > div > div > div.monaco-scrollable-element > div.split-view-container > div:nth-child(1)" = "height: 9999px !important;";
        ".composite.viewlet.explorer-viewlet > div > div > div.monaco-scrollable-element > div.split-view-container > div:nth-child(2)" = "margin-top: 30px !important;";
        # Round List item corners
        ".monaco-list-row" = "border-radius: 6px";

        # Activity bar
        # Move Activity bar to top
        "body > div > div.monaco-grid-view > div > div > div.monaco-scrollable-element > div.split-view-container > div.split-view-view.visible > div > div > div.monaco-scrollable-element > div.split-view-container > div:nth-child(2) > div > div > div.monaco-scrollable-element > div.split-view-container > div:nth-child(1)" = "top: 41px !important";
        "body > div > div.monaco-grid-view > div > div > div.monaco-scrollable-element > div.split-view-container > div.split-view-view.visible > div > div > div.monaco-scrollable-element > div.split-view-container > div:nth-child(2) > div > div > div.monaco-scrollable-element > div.split-view-container > div:nth-child(2)" = "top: -5px !important";
        # offset to account for kde frame
        ".activitybar" = "margin-left: -4px !important";

        #Explorer
        ".pane-header" = "height: 30px !important";
        ".monaco-tl-twistie" = "visibility: hidden !important; margin-left: -20px";
        ".monaco-workbench .part.editor>.content .editor-group-container>.title:not(.tabs)" = "height: 45px";
        ".monaco-list-row.focused.selected" = "outline: 2px solid #454545 !important; outline-offset: -2px !important;";

        # Command Pallet
        # Center command Pallet
        ".quick-input-widget.show-file-icons" = "top: calc(50vh - 300px) !important; outline: 2px solid #a080ff; padding: 10px;";
        ".monaco-inputbox" = "padding: 4px; border-radius: 6px; border: 2px solid #454545 !important;";
        ".monaco-editor .find-widget" = "border: 2px solid #353535; padding-top: 6px;padding-bottom: 48px !important; border-radius: 6px; padding-left: 20px";
        ".editor-widget.find-widget.visible.replaceToggled" = "padding-bottom: 89px !important;";
        ".monaco-editor .find-widget .button.toggle" = "padding: 16px;";
        ".monaco-editor .find-widget>.find-part .find-actions; .monaco-editor .find-widget>.replace-part .replace-actions" = "height: 20px !important";

        #".quick-input-list .monaco-list-row"= "top: 0px !important; position: relative !important; padding-top: 10px !important";
        #".monaco-list.list_id_7 .monaco-list-rows"= "padding-bottom: 70px";
        ".monaco-icon-label>.monaco-icon-label-container>.monaco-icon-description-container>.label-description" = "display: none";
      };

      "editor.lineHeight" = 20;

      "apc.sidebar.titlebar" = {
        "height" = 50;
        "fontSize" = 14;
      };

      "apc.listRow" = {
        "lists" = [
          "explorer-folders-view"
          "results"
          "open-editors"
        ];
        "height" = 28;
        "fontSize" = 14;
      };

      "apc.activityBar" = {
        "position" = "bottom";
        "size" = 50;
        "itemSize" = 40;
      };

      "workbench.colorTheme" = "Visual Studio Dark";
      "workbench.activityBar.location" = "top";

      "workbench.colorCustomizations" = {
        "activityBar.background" = "#202020";
        "activityBar.activeBorder" = "#0000";

        "sideBar.border" = "#0000";
        "sideBar.foreground" = "#FFFFFF";
        "sideBar.background" = "#202020";
        "sideBarSectionHeader.background" = "#202020";
        "sideBarSectionHeader.border" = "#0000";

        "list.hoverBackground" = "#353535";
        "list.activeSelectionBackground" = "#353535";
        "list.inactiveSelectionBackground" = "#353535";
        "sideBarSectionHeader.foreground" = "#FFFFFF";
        "sideBarTitle.foreground" = "#FFFFFF";

        "focusBorder" = "#a080ff";
        "list.focusBackground" = "#353535";
        "editorWidget.border" = "#353535";
        "editorGroup.border" = "#0000";

        "editor.background" = "#202020";
        "input.background" = "#353535";
        "button.background" = "#a080ff";
        "button.secondaryBackground" = "#353535";
        "scrollbar.shadow" = "#0000";

        "activityBarBadge.background" = "#a080ff";

        # Git Colors
        "gitDecoration.deletedResourceForeground" = "#FF5271";
        "gitDecoration.modifiedResourceForeground" = "#a080ff";
        "gitDecoration.untrackedResourceForeground" = "#61FFB3";
        "editorGutter.deletedBackground" = "#FF5271";
        "editorGutter.modifiedBackground" = "#a080ff";
        "editorGutter.addedBackground" = "#61FFB3";

        # Error
        "errorForeground" = "#FF5271";
        "list.errorForeground" = "#FF5271";
        "list.warningForeground" = "#FFA062";

        "errorLens.errorForeground" = "#FF5271";
        "errorLens.errorBackground" = "#FF527120";
        "errorLens.warningForeground" = "#FFA062";
        "errorLens.warningBackground" = "#FFC18D20";

        # Brackets
        "editorBracketHighlight.foreground1" = "#A080FF";
        "editorBracketHighlight.foreground3" = "#80B9FF";
        "editorBracketHighlight.foreground6" = "#8BF9FF";
        "editorBracketHighlight.foreground5" = "#61FFB3";
        "editorBracketHighlight.foreground4" = "#FFF89B";
        "editorBracketHighlight.foreground2" = "#FFA062";
      };

      "editor.tokenColorCustomizations" = {
        "textMateRules" = [
          {
            "name" = "Default";
            "scope" = [
              ""
              "support.type.property-name.json"
              "meta.attribute.unrecognized"
              "support.type.property-name.css"
              "meta.field.declaration"
              "meta.template.expression"
            ];
            "settings" = {
              "foreground" = "#FFFFFF";
            };
          }

          {
            "name" = "comments";
            "scope" = ["comment"];
            "settings" = {
              "foreground" = "#AAAAAA";
            };
          }

          {
            "name" = "string";
            "scope" = [
              "string.quoted.single"
              "string.quoted.double"
              "string.template"
              "punctuation.definition.string.template"
              "variable.parameter.url.css"
              "string.quoted.other.nix"
            ];
            "settings" = {
              "foreground" = "#a080ff";
            };
          }

          {
            "name" = "number";
            "scope" = [
              "constant.numeric"
              "keyword.other.unit"
              "constant.other.color.rgb-value.hex"
            ];
            "settings" = {
              "foreground" = "#FFA062";
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
              "foreground" = "#8BF9FF";
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
              # "support.type.builtin.tsx"
              "support.type.builtin"
            ];
            "settings" = {
              "foreground" = "#80B9FF";
            };
          }
        ];
      };
    };
  };
}
