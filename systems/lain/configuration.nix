# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../common/global
    ../common/features/systemd-boot.nix
    ../common/features/audio.nix
    ../common/features/kde.nix
    ../common/features/bluetooth.nix
    ../common/features/printing.nix
    ../common/features/flatpak.nix
    ../common/features/steam.nix

    ../common/users/riaru.nix
    ../common/features/virtulization.nix
    ../common/features/kdeconnect.nix
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
  users.groups.uinput.members = ["riaru"];
  users.groups.input.members = ["riaru"];
  
  system.stateVersion = "24.05"; # Did you read the comment?
}
