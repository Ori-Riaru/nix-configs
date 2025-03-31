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

    ../_share/global
    ../_share/systemd-boot.nix
    ../_share/audio.nix
    ../_share/kde.nix
    ../_share/bluetooth.nix
    ../_share/printing.nix
    ../_share/steam.nix

    ../../users/riaru
    ../_share/virtulization.nix
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
