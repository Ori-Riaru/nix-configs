{inputs, ...}: {
  imports = [
    inputs.xremap-flake.homeManagerModules.default
  ];
  services.xremap = {
    enable = true;
    withKDE = true;
    config = {
      virtual_modifiers = [
        "CAPSLOCK"
      ];

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
            "SUPER-A" = "LEFT";
            "SUPER-S" = "DOWN";
            "SUPER-D" = "UP";
            "SUPER-F" = "RIGHT";

            "SUPER-W" = "SHIFT-CTRL-LEFT";
            "SUPER-Q" = "HOME";
            "SUPER-R" = "END";
            "SUPER-E" = "SHIFT-CTRL-RIGHT";
          };
        }
        {
          name = "devork-qwerty";
          application = {
            not = [
              "blender"
              "Blender"
            ];
          };
          exact_match = false;
          remap = {
            # Swap devorak keys to qwerty when any combination of CTRL + ALT + SHIFT is pressed
            "CTRL-Q" = "CTRL-X";
            "CTRL-W" = "CTRL-COMMA";
            "CTRL-E" = "CTRL-D";
            "CTRL-R" = "CTRL-O";
            "CTRL-T" = "CTRL-K";
            "CTRL-Y" = "CTRL-T";
            "CTRL-U" = "CTRL-F";
            "CTRL-I" = "CTRL-G";
            "CTRL-O" = "CTRL-S";
            "CTRL-P" = "CTRL-R";
            "CTRL-S" = "CTRL-SEMICOLON";
            "CTRL-D" = "CTRL-H";
            "CTRL-F" = "CTRL-Y";
            "CTRL-G" = "CTRL-U";
            "CTRL-H" = "CTRL-J";
            "CTRL-J" = "CTRL-C";
            "CTRL-K" = "CTRL-V";
            "CTRL-L" = "CTRL-P";
            "CTRL-Z" = "CTRL-SLASH";
            "CTRL-X" = "CTRL-B";
            "CTRL-C" = "CTRL-I";
            "CTRL-V" = "CTRL-DOT";
            "CTRL-B" = "CTRL-N";
            "CTRL-N" = "CTRL-L";

            "CTRL-MINUS" = "CTRL-APOSTROPHE";
            "CTRL-EQUAL" = "CTRL-RIGHTBRACE";
            "CTRL-LEFTBRACE" = "CTRL-MINUS";
            "CTRL-RIGHTBRACE" = "CTRL-EQUAL";
            "CTRL-SEMICOLON" = "CTRL-Z";
            "CTRL-APOSTROPHE" = "CTRL-Q";
            "CTRL-COMMA" = "CTRL-W";
            "CTRL-DOT" = "CTRL-E";
            "CTRL-SLASH" = "CTRL-LEFTBRACE";
          };
        }
      ];
    };
  };
}
