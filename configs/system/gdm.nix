{
  services.displayManager = {
    defaultSession = "niri";
    gdm = {
      enable = true;
      wayland = true;
    };
  };
}
