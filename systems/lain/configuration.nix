# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  settings,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../share/global
    ../share/features/systemd-boot.nix
    ../share/features/audio.nix
    ../share/features/kde.nix
    ../share/features/bluetooth.nix
    ../share/features/printing.nix
    ../share/features/steam.nix

    ../share/users/riaru.nix
    ../share/features/virtulization.nix
    ../share/features/kdeconnect.nix
  ];

  networking.hostName = "lain";

  #Nvidia

  hardware.graphics = {
    enable = true;
  };

  services.xserver.videoDrivers = ["nvidia"];
  
  hardware.nvidia = {
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
  };

  #Nvidia

  services.suwayomi-server = {
    enable = true;
  };

  services.ratbagd.enable = true;
  services.touchegg.enable = true;

  
  hardware.uinput.enable = true;
  users.groups.uinput.members = ["${settings.username}"];
  users.groups.input.members = ["${settings.username}"];
  
  system.stateVersion = "24.05";
}
