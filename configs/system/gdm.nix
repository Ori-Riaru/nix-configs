{pkgs, ...}: {
  services.displayManager = {
    defaultSession = "niri";
    gdm.enable = true;
  };
}
