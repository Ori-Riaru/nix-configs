{
  pkgs,
  config,
  ...
}: {
  services.minecraft-server = {
    enable = false;
    eula = true;
    package = pkgs.papermc;
    dataDir = "/data/vanilla-june-2026/";
    openFirewall = true;
    declarative = true;

    serverProperties = {
      server-port = 25565;
      gamemode = "survival";
      difficulty = "hard";
      motd = "AOEU";
    };

    jvmOpts = "-Xms8192M -Xmx8192M";
  };

  # Modded minecraft
  networking.firewall.allowedTCPPorts = [config.services.minecraft-server.serverProperties.server-port];

  environment.systemPackages = with pkgs; [
    screen
    # openjdk8-bootstrap
    openjdk25
  ];

  # Launch Enigmatica 2 Expert Extended
  # cd /data/minecraft/e2ee
  # ./start-server.sh
}
