{
  pkgs,
  settings,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../_share/global
    ../_share/systemd-boot.nix
    ../_share/audio.nix
    ../_share/kde.nix
    ../_share/bluetooth.nix
    ../_share/printing.nix
    ../_share/steam.nix
    ../_share/hyprland.nix
    ../_share/niri.nix

    ../../users/riaru
    ../_share/virtulization.nix
  ];

  # # Install CIFS utilities
  # environment.systemPackages = [pkgs.cifs-utils];

  # # Mount the share
  # fileSystems."/mnt/sambashare" = {
  #   device = "//192.168.2.22/shared"; # Replace SERVER_IP with the actual IP address
  #   fsType = "cifs";
  #   options = let
  #     # Prevent hanging on network issues
  #     automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
  #   in ["${automount_opts},credentials=/home/riaru/Documents/Passwords/smb-secrets,uid=1000,gid=100"];
  # };

  # environment.systemPackages = with pkgs; [
  #   samba
  # ];

  # services.postgresql = {
  #   enable = true;
  #   package = pkgs.postgresql_16;
  #   ensureDatabases = ["mydatabase"];
  #   enableTCPIP = true;

  #   authentication = pkgs.lib.mkOverride 10 ''
  #     #...
  #     #type database DBuser origin-address auth-method
  #     local all       all     trust
  #     # ipv4
  #     host  all      all     127.0.0.1/32   trust
  #     # ipv6
  #     host all       all     ::1/128        trust
  #   '';
  #   initialScript = pkgs.writeText "backend-initScript" ''
  #     CREATE ROLE nixcloud WITH LOGIN PASSWORD 'nixcloud' CREATEDB;
  #     CREATE DATABASE nixcloud;
  #     GRANT ALL PRIVILEGES ON DATABASE nixcloud TO nixcloud;
  #   '';
  # };

  # services.suwayomi-server = {
  #   enable = true;
  # };

  # services.ratbagd.enable = true;
  services.touchegg.enable = true;

  hardware.uinput.enable = true;
  users.groups.uinput.members = ["${settings.username}"];
  users.groups.input.members = ["${settings.username}"];

  networking.hostName = "shizuku";

  # Enable Auto Rotate
  hardware.sensor.iio.enable = true;

  system.stateVersion = "24.05";
}
