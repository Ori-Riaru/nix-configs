{pkgs, ...}: {
  services.dbus.packages = [
    pkgs.nautilus
  ];  
}
