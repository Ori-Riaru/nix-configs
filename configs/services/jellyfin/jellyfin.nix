{
  pkgs,
  settings,
  ...
}: {
  services.jellyfin = {
    enable = true;
    openFirewall = true;
  };
  services.seerr = {
    enable = true;
    openFirewall = true;
  };
  services.sonarr = {
    enable = true;
    openFirewall = true;
  };
  services.radarr = {
    enable = true;
    openFirewall = true;
  };
  services.lidarr = {
    enable = true;
    openFirewall = true;
  };
  services.prowlarr = {
    enable = true;
    openFirewall = true;
  };

  environment.systemPackages = [
    pkgs.master.jellyfin
    pkgs.jellyfin-web
    pkgs.jellyfin-ffmpeg
  ];

  security.acme = {
    acceptTerms = true;
    defaults.email = settings.email;
  };

  services.nginx = {
    enable = true;
    virtualHosts."riaru.undo.it" = {
      forceSSL = true;
      enableACME = true;
      locations."/" = {
        proxyPass = "http://localhost:8096";
        proxyWebsockets = true;
      };
    };
  };

  networking.firewall.allowedTCPPorts = [80 443 5055 8989 7878 8686 9696];
}
