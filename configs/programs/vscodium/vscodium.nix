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

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    profiles.default = {
      enableUpdateCheck = false;

      keybindings = [
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
