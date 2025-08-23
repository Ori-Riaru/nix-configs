{pkgs, ...}: {
  services.minecraft-server = {
    enable = false;
    eula = true;
    dataDir = "/data/minecraft/";
    openFirewall = true;
    declarative = true;

    serverProperties = {
      server-port = "25566";
      gamemode = "survival";
      difficulty = "hard";
    };

    whitelist = {
      riaru = "09aa071b-9237-4cba-861a-9ae7d5328f95";
    };
  };

  
  # Modded minecraft
  networking.firewall.allowedTCPPorts = [25565];

  environment.systemPackages = with pkgs; [
    screen
    openjdk8-bootstrap
  ];

  # Launch Enigmatica 2 Expert Extended
  # cd /data/minecraft/e2ee
  # ./start-server.sh
}
