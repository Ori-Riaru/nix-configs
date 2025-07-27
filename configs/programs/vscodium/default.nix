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
    ./usersettings.nix
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    profiles.default = {
      enableUpdateCheck = false;

      keybindings = [
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
