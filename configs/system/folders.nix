{settings, ...}: {
  home = {
    username = "${settings.username}";
    homeDirectory = "/home/${settings.username}";
  };

  xdg.userDirs.enable = true;

  home.file = {
    "Games/.keep".text = "";
    "Temp/.keep".text = "";
    "Templates/Text Document".text = "";
  };
}
