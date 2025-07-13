{inputs, ...}: {
  imports = [
    inputs.xremap-flake.homeManagerModules.default
  ];

  services.xremap = {
    enable = true;
    config = {
      modmap = [
        {
          name = "Extra Meta";
          # Swap Escape and Tilda key
          remap = {
            "ESC" = "GRAVE";
            "GRAVE" = "ESC";
          };
        }
      ];

      keymap = [
        {
          name = "Cursor";
          remap = {
            # Text Cursor Movement
            "ALT-J" = "LEFT";
            "ALT-K" = "UP";
            "ALT-L" = "DOWN";
            "ALT-SEMICOLON" = "RIGHT";

            "ALT-I" = "CTRL-LEFT";
            "ALT-O" = "CTRL-RIGHT";
            "ALT-U" = "HOME";
            "ALT-P" = "END";
            "ALT-H" = "SUPER-LEFT";
            "ALT-APOSTROPHE" = "SUPER-RIGHT";

            "ALT-M" = "CTRL-B";
            "ALT-COMMA" = "CTRL-I";
            "ALT-DOT" = "CTRL-DOT";       
            "ALT-SLASH" = "CTRL-SLASH";
            "ALT-A" = "ESC";     
          };
        }
      ];
    };
  };
}
