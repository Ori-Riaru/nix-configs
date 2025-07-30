# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  settings,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../../configs/system/global
    ../../configs/system/systemd-boot.nix
    ../../configs/system/audio.nix
    ../../configs/system/kde.nix
    ../../configs/system/bluetooth.nix
    ../../configs/system/printing.nix
    ../../configs/system/steam.nix
    ../../configs/programs/niri/niri-system.nix
    ../../configs/programs/smb-mount.nix
    ../../configs/system/virtulization.nix
    ../../configs/services/tailscale.nix
    ../../configs/programs/nfs-client.nix
    ../../configs/services/hamachi.nix
    ../../configs/services/quake.nix
    ../../configs/programs/kdeconnect.nix
    ../../configs/programs/monado/monado.nix
    ../../configs/programs/sops.nix
    ../../configs/programs/kanata.nix
    ../../configs/programs/sudo.nix

    ../../users/riaru
  ];

  networking.hostName = "lain";

  #Nvidia
  hardware.graphics = {
    enable = true;
  };

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
  };

  services.ratbagd.enable = true;

  hardware.uinput.enable = true;
  users.groups.uinput.members = ["${settings.username}"];
  users.groups.input.members = ["${settings.username}"];

  system.stateVersion = "24.05";
}
