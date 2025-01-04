{
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../common/global
    ../common/optional/systemd-boot.nix
    ../common/optional/audio.nix
    ../common/optional/kde.nix
    ../common/optional/bluetooth.nix
    ../common/optional/printing.nix
    ../common/optional/flatpak.nix
    ../common/optional/steam.nix

    ../common/users/riaru
    ../common/optional/virtulization.nix
    ../common/optional/kdeconnect.nix
  ];

  environment.systemPackages = with pkgs; [
    samba 
  ];
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_16;
    ensureDatabases = ["mydatabase"];
    enableTCPIP = true;

    authentication = pkgs.lib.mkOverride 10 ''
      #...
      #type database DBuser origin-address auth-method
      local all       all     trust
      # ipv4
      host  all      all     127.0.0.1/32   trust
      # ipv6
      host all       all     ::1/128        trust
    '';
    initialScript = pkgs.writeText "backend-initScript" ''
      CREATE ROLE nixcloud WITH LOGIN PASSWORD 'nixcloud' CREATEDB;
      CREATE DATABASE nixcloud;
      GRANT ALL PRIVILEGES ON DATABASE nixcloud TO nixcloud;
    '';
  };

  services.suwayomi-server = {
    enable = true;
  };

  services.ratbagd.enable = true;
  services.touchegg.enable = true;

  hardware.uinput.enable = true;
  users.groups.uinput.members = ["riaru"];
  users.groups.input.members = ["riaru"];

  networking.hostName = "shizuku";

  # Enable Auto Rotate
  hardware.sensor.iio.enable = true;

  system.stateVersion = "24.05";
}
