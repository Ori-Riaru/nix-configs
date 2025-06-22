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

    ../../modules/services/tailscale.nix

    ../../users/riaru
  ];

  # services.ratbagd.enable = true;

  hardware.uinput.enable = true;

  networking.hostName = "shizuku";

  # Enable Auto Rotate
  hardware.sensor.iio.enable = true;

  system.stateVersion = "24.05";
}
