{
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../share/global
    ../share/features/systemd-boot.nix
    ../share/features/audio.nix
    ../share/features/kde.nix
    ../share/features/bluetooth.nix
    ../share/features/printing.nix
    ../share/features/flatpak.nix
    ../share/features/steam.nix

    ../share/users/riaru.nix
    ../share/features/virtulization.nix
    ../share/features/kdeconnect.nix
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
