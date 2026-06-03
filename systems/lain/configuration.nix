{
  pkgs,
  config,
  settings,
  ...
}: {
  imports = [
    ../../configs/groups/global.nix

    # Hardware
    ./hardware-configuration.nix
    ../../configs/system/nvidia.nix
    ../../configs/system/systemd-boot.nix
    ../../configs/system/silent-boot.nix
    ../../configs/system/audio.nix
    ../../configs/system/bluetooth.nix
    ../../configs/system/printing.nix
    ../../configs/system/virtulization.nix

    # Nix
    ../../configs/programs/sops.nix # Make global
    ../../configs/programs/sudo.nix # Make global
    ../../configs/services/tailscale.nix # Make global

    # User
    ../../users/riaru
    ../../configs/programs/nfs-client.nix
    ../../configs/programs/kanata.nix

    # Desktop
    ../../configs/system/gdm.nix
    ../../configs/programs/niri/niri-system.nix # make module
    ../../configs/system/gvfs.nix # make module
    ../../configs/system/gsettings-desktop-schema.nix # make module

    # Applications
    ../../configs/programs/steam.nix
    ../../configs/programs/kdeconnect/kdeconnect-system.nix
    ../../configs/programs/openrgb/openrgb-system.nix
    ../../configs/programs/sleepy-launcher.nix

    # Misc
    ../../configs/programs/fish/fish-system.nix
  ];

  networking.hostName = "lain";
  home-manager.users.riaru = import ../../users/riaru/lain/home.nix;

  services.ratbagd.enable = true;
  services.xserver.digimend.enable = true;
  # hardware.opentabletdriver = {
  #   enable = true;
  #   daemon.enable = true;
  # };

  system.stateVersion = "26.05";
}
