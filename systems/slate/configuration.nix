{settings, ...}: {
  imports = [
    ./hardware-configuration.nix

    ../../configs/groups/global.nix
    ../../configs/system/gsettings-desktop-schema.nix
    ../../configs/system/systemd-boot.nix
    ../../configs/system/audio.nix
    ../../configs/system/gdm.nix
    ../../configs/system/bluetooth.nix
    ../../configs/system/printing.nix
    ../../configs/programs/kde/kde-system.nix
    ../../configs/programs/sops.nix
    ../../configs/programs/niri/niri-system.nix
    ../../configs/programs/nfs-client.nix
    ../../configs/programs/smb-mount.nix
    ../../configs/system/virtulization.nix
    ../../configs/programs/kdeconnect.nix
    ../../configs/programs/steam.nix
    ../../configs/programs/kanata.nix
    ../../configs/programs/sudo.nix

    ../../configs/services/tailscale.nix

    ../../users/riaru
  ];

  networking.hostName = "slate";

  services.nfs-client.serverIP = settings.serverTailscaleIP;

  # Enable Auto Rotate
  hardware.sensor.iio.enable = true;
  hardware.uinput.enable = true;

  system.stateVersion = "24.05";
}
