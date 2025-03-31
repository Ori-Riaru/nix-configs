{settings, ...}: {
  home = {
    username = "${settings.username}";
    homeDirectory = "/home/${settings.username}";
  };

  # Create none standard default folders
  home.file = {
    "Captures/.keep".text = "";
    "Games/.keep".text = "";
    "Notes/.keep".text = "";
    "Projects/.keep".text = "";
    "Temp/.keep".text = "";
  };
}
