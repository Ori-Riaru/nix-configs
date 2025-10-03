{settings, ...}: {
  imports = [
    ./hardware-configuration.nix

    ../../configs/system/global
    ../../configs/system/systemd-boot.nix
    ../../configs/system/audio.nix
    ../../configs/system/bluetooth.nix
    ../../configs/system/printing.nix
    ../../configs/system/gdm.nix
    ../../configs/programs/niri/niri-system.nix
    ../../configs/programs/sudo.nix

    ../../users/riaru
  ];

  networking.hostName = "minimal";

  system.stateVersion = "24.05";
}
