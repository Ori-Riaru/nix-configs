{
  pkgs,
  settings,
  config,
  ...
}: {
  home.packages = with pkgs; [
    direnv
  ];

  imports = [
    ./extensions.nix
    ./usersettings.nix
  ];

  programs.vscodium = {
    enable = true;

    profiles.default = {
      enableUpdateCheck = false;

      keybindings = [
        {
          key = "alt";
          command = "-workbench.action.toggleMenuBar";
        }
        # Fast Cursor movement with ctrl
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

        # Expand region shortcuts
        {
          key = "ctrl+e";
          command = "expand_region";
          when = "editorTextFocus";
        }
        {
          key = "ctrl+shift+e";
          command = "undo_expand_region";
          when = "editorTextFocus && editorHasSelection";
        }

        # Pallet and open shortcuts
        {
          key = "ctrl+o";
          command = "workbench.action.quickOpen";
        }
        {
          key = "ctrl+p";
          command = "workbench.action.showCommands";
        }
      ];
    };
  };
}
