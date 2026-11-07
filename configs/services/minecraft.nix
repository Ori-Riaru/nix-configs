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

  environment.systemPackages = with pkgs; [
    screen
    # openjdk8-bootstrap
    openjdk25
  ];

  # Modded minecraft

  # use flake + direnv to get modpack specific versions

  networking.firewall.allowedTCPPorts = [25565];
  networking.firewall.allowedUDPPorts = [25565];
}
