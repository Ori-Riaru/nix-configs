{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.options.services.hytale;
in {
  # Launch Server
  # cd /data/hytale/Server
  # ./start-server.sh

  options.services.hytale = {
    enable = lib.mkEnableOption "Open ports and install system dependencies for hytale";
  };

  config = lib.mkIf cfg.enable {
    networking.firewall.allowedUDPPorts = [5520];
    environment.systemPackages = with pkgs; [
      openjdk25
      screen
    ];
  };
}
