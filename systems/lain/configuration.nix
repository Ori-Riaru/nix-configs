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

    ../../modules/_share/global
    ../../modules/_share/systemd-boot.nix
    ../../modules/_share/audio.nix
    ../../modules/_share/kde.nix
    ../../modules/_share/bluetooth.nix
    ../../modules/_share/printing.nix
    ../../modules/_share/steam.nix
    ../../modules/_share/virtulization.nix

    ../../users/riaru
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
