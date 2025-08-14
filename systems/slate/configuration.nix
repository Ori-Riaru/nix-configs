{...}: {
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

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
    ../../configs/programs/nfs-client.nix   
    ../../configs/programs/kdeconnect.nix
    # ../../configs/programs/monado.nix
    ../../configs/programs/sops.nix
    ../../configs/programs/kanata.nix
    ../../configs/programs/sudo.nix    

    ../../configs/services/homepage.nix
    ../../configs/services/tailscale.nix


    ../../users/riaru

  ];

  networking.hostName = "slate";

  # Enable Auto Rotate
  hardware.sensor.iio.enable = true;
  hardware.uinput.enable = true;

  system.stateVersion = "24.05";
}
