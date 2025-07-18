{...}: {
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  imports = [
    ./hardware-configuration.nix

    ../../modules/_share/global
    ../../modules/_share/systemd-boot.nix
    ../../modules/_share/audio.nix
    ../../modules/_share/kde.nix
    ../../modules/_share/bluetooth.nix
    ../../modules/_share/printing.nix
    ../../modules/_share/steam.nix
    ../../modules/_share/niri.nix
    ../../modules/_share/smb-mount.nix
    ../../modules/_share/virtulization.nix
    ../../modules/programs/nfs-client.nix
    ../../modules/programs/kdeconnect.nix
    # ../../modules/programs/monado.nix

    ../../modules/services/tailscale.nix

    ../../users/riaru
  ];

  networking.hostName = "slate";

  # Enable Auto Rotate
  hardware.sensor.iio.enable = true;
  hardware.uinput.enable = true;

  system.stateVersion = "24.05";
}
