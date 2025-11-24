{settings, ...}: {
  imports = [
    ./hardware-configuration.nix

    ../../configs/groups/global.nix
    ../../configs/system/gsettings-desktop-schema.nix
    ../../configs/system/nvidia.nix
    ../../configs/system/systemd-boot.nix
    ../../configs/system/audio.nix
    ../../configs/system/gdm.nix
    ../../configs/system/bluetooth.nix
    ../../configs/system/printing.nix
    ../../configs/programs/niri/niri-system.nix
    #// ../../configs/programs/hyprland/hyprland-system.nix
    #// ../../configs/programs/kde/kde-system.nix
    ../../configs/programs/kdeconnect.nix
    ../../configs/programs/nfs-client.nix
    ../../configs/programs/smb-mount.nix
    ../../configs/system/virtulization.nix
    ../../configs/services/tailscale.nix
    ../../configs/services/hamachi.nix
    ../../configs/programs/steam.nix
    ../../configs/services/quake.nix
    ../../configs/programs/monado/monado.nix
    ../../configs/programs/sops.nix
    ../../configs/programs/kanata.nix
    ../../configs/programs/sudo.nix
    ../../configs/programs/openrgb/openrgb-system.nix

    ../../users/riaru
  ];

  networking.hostName = "lain";

  services.ratbagd.enable = true;

  hardware.uinput.enable = true;
  users.groups.uinput.members = ["${settings.username}"];
  users.groups.input.members = ["${settings.username}"];

  system.stateVersion = "24.05";
}
