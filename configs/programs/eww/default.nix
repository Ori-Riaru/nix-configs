{ pkgs, ... }: {
  home.packages = with pkgs; [
    eww
    python3
    python3Packages.dbus-python
    python3Packages.pygobject3
  ];
  
  home.file.".config/eww/eww.yuck".source = ./eww.yuck;
  home.file.".config/eww/notifications/main.yuck".source = ./notifications/eww.yuck;
  home.file.".config/eww/notifications/main.py" = {
    source = ./notifications/main.py;
    executable = true;
  };
}
