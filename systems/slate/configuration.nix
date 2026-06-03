{settings, ...}: {
  imports = [
    ../../configs/groups/global.nix

    # Hardware
    ./hardware-configuration.nix
    ../../configs/system/systemd-boot.nix
    ../../configs/system/printing.nix
    ../../configs/system/bluetooth.nix
    ../../configs/system/virtulization.nix
    ../../configs/system/audio.nix

    # Nix
    ../../configs/programs/sops.nix # Make global
    ../../configs/programs/sudo.nix # Make global
    ../../configs/system/silent-boot.nix # Make global
    ../../configs/services/tailscale.nix # Make global

    # Users
    ../../users/riaru
    ../../configs/programs/nfs-client.nix
    ../../configs/programs/fish/fish-system.nix
    ../../configs/programs/kanata.nix

    # Desktop
    ../../configs/system/gdm.nix # Make module
    ../../configs/programs/niri/niri-system.nix # Make module
    ../../configs/system/gsettings-desktop-schema.nix # Make module
    ../../configs/programs/kdeconnect/kdeconnect-system.nix # Make module

    # Applications
    ../../configs/programs/steam.nix
  ];

  networking.hostName = "slate";
  home-manager.users.riaru = import ../../users/riaru/lain/home.nix;

  services.nfs-client.serverIP = settings.serverTailscaleIP;

  # Enable Auto Rotate
  hardware.sensor.iio.enable = true;

  system.stateVersion = "26.05";
}
