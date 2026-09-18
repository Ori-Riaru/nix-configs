{...}: {
  services.tailscale.derper = {
    enable = true;
    domain = "derp.v0id.nl";
    stunPort = 3479; # coturn already listens on UDP 3478
    verifyClients = true;
    openFirewall = true;
  };

  services.nginx.virtualHosts."derp.v0id.nl".enableACME = true;
}
