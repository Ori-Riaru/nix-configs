{settings, ...}: {
  imports = [
    ../../configs/groups/global.nix

    # Hardware
    ./hardware-configuration.nix
    ../../configs/system/systemd-boot.nix
    ../../configs/system/printing.nix
    ../../configs/system/bluetooth.nix
    ../../configs/system/virtualization.nix
    ../../configs/system/audio.nix
    ../../configs/system/power-profiles.nix

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
  home-manager.users.riaru = import ../../users/riaru/slate/home.nix;

  networking.hosts.${settings.serverTailscaleIP} = [
    "riaru.home.kg"
    "riaru.undo.it"
    "my.v0id.nl"
    "signal.v0id.nl"
    "livekit.v0id.nl"
  ];

  services.nfs-client.serverIP = settings.serverTailscaleIP;

  # Enable Auto Rotate
  hardware.sensor.iio.enable = true;

  system.stateVersion = "26.05";
}
