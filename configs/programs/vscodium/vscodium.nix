{
  pkgs,
  settings,
  config,
  ...
}:
{
  home.packages = with pkgs; [
    direnv
  ];

  imports = [
    ./extensions.nix
    ./usersettings.nix
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    profiles.default = {
      enableUpdateCheck = false;

      keybindings = [
        # Move word by default
        # {
        #   "key" = "left";
        #   "command" = "-cursorLeft";
        #   "when" = "editorTextFocus";
        # }
        # {
        #   "key" = "right";
        #   "command" = "-cursorRight";
        #   "when" = "editorTextFocus";
        # }
        # {
        #   "key" = "ctrl+left";
        #   "command" = "-cursorWordLeft";
        #   "when" = "editorTextFocus";
        # }
        # {
        #   "key" = "ctrl+right";
        #   "command" = "-cursorWordRight";
        #   "when" = "editorTextFocus";
        # }
        # {
        #   "key" = "alt+right";
        #   "command" = "-workbench.action.navigateForward";
        # }
        # {
        #   "key" = "alt+left";
        #   "command" = "-workbench.action.navigateBack";
        # }
        # {
        #   "key" = "left";
        #   "command" = "cursorWordPartLeft";
        #   "when" = "editorTextFocus";
        # }
        # {
        #   "key" = "right";
        #   "command" = "cursorWordPartRight";
        #   "when" = "editorTextFocus";
        # }
        # {
        #   "key" = "ctrl+left";
        #   "command" = "cursorLeft";
        #   "when" = "editorTextFocus";
        # }
        # {
        #   "key" = "ctrl+right";
        #   "command" = "cursorRight";
        #   "when" = "editorTextFocus";
        # }
        # {
        #   "key" = "shift+left";
        #   "command" = "cursorWordPartLeftSelect";
        #   "when" = "editorTextFocus";
        # }
        # {
        #   "key" = "shift+right";
        #   "command" = "cursorWordPartRightSelect";
        #   "when" = "editorTextFocus";
        # }
        # {
        #   "key" = "ctrl+shift+left";
        #   "command" = "cursorLeftSelect";
        #   "when" = "editorTextFocus";
        # }
        # {
        #   "key" = "ctrl+shift+right";
        #   "command" = "cursorRightSelect";
        #   "when" = "editorTextFocus";
        # }

        # Jump cursor by 4 lines
        {
          "key" = "ctrl+up";
          "command" = "cursorMove";
          "args" = {
            "to" = "up";
            "by" = "line";
            "value" = 4;
          };
          "when" = "editorTextFocus";
        }
        {
          "key" = "ctrl+down";
          "command" = "cursorMove";
          "args" = {
            "to" = "down";
            "by" = "line";
            "value" = 4;
          };
          "when" = "editorTextFocus";
        }
        {
          "key" = "ctrl+shift+up";
          "command" = "cursorMove";
          "args" = {
            "to" = "up";
            "by" = "line";
            "value" = 4;
            "select" = true;
          };
          "when" = "editorTextFocus";
        }
        {
          "key" = "ctrl+shift+down";
          "command" = "cursorMove";
          "args" = {
            "to" = "down";
            "by" = "line";
            "value" = 4;
            "select" = true;
          };
          "when" = "editorTextFocus";
        }

        # Delete word by default

        # {
        #   "key" = "delete";
        #   "command" = "-deleteRight";
        #   "when" = "editorTextFocus && !editorReadonly";
        # }
        # {
        #   "key" = "backspace";
        #   "command" = "-deleteLeft";
        #   "when" = "editorTextFocus && !editorReadonly";
        # }

        # {
        #   "key" = "delete";
        #   "command" = "deleteWordPartRight";
        #   "when" = "editorTextFocus && !editorReadonly";
        # }
        # {
        #   "key" = "backspace";
        #   "command" = "deleteWordPartLeft";
        #   "when" = "editorTextFocus && !editorReadonly";
        # }
        # {
        #   "key" = "ctrl+delete";
        #   "command" = "deleteRight";
        #   "when" = "editorTextFocus && !editorReadonly";
        # }
        # {
        #   "key" = "ctrl+backspace";
        #   "command" = "deleteLeft";
        #   "when" = "editorTextFocus && !editorReadonly";
        # }

        # Expand region shortcuts
        {
          key = "ctrl+w";
          command = "expand_region";
          when = "editorTextFocus";
        }
        {
          key = "ctrl+shift+w";
          command = "undo_expand_region";
          when = "editorTextFocus && editorHasSelection";
        }
      ];
    };
  };
}
