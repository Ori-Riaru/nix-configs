{pkgs, ...}: {
  services.jellyfin.enable = true;

  environment.systemPackages = [
    pkgs.jellyfin
    pkgs.jellyfin-web
    pkgs.jellyfin-ffmpeg
  ];

  services.nginx.enable = true;
  services.nginx.virtualHosts."riaru.undo.it" = {
    forceSSL = true;
    enableACME = true;
    locations."/" = {
      proxyPass = "http://localhost:8096";
      proxyWebsockets = true;
    };
  };

  networking.firewall.allowedTCPPorts = [80 443];
}
