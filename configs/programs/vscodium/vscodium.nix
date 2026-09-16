{
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
