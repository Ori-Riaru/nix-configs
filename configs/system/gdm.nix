{pkgs, ...}: {
  services.displayManager = {
    defaultSession = "niri";
    cosmic-greeter.enable = true;
  };
}
