{...}: {
  services.tailscale.derper = {
    enable = true;
    domain = "derp.riaru.xyz";
    stunPort = 3479; # coturn already listens on UDP 3478
    verifyClients = true;
    openFirewall = true;
  };

  services.nginx.virtualHosts."derp.riaru.xyz".enableACME = true;
}
