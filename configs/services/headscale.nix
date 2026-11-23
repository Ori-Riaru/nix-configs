{config, ...}: {
  # Manual: creation of a user using the headscale cli is required
  # sudo tailscale users create <username>

  # Manual: authentication of each tailscale client is required using the tailscale client see
  # tailscale.nix

  # Run `sudo headscale nodes list` to get new ip addresses for each machine

  services.headscale = {
    enable = true;
    address = "127.0.0.1";
    port = 7411;
    settings = {
      server_url = "https://tail.riaru.xyz";
      dns = {
        magic_dns = true;
        base_domain = "hs.riaru.xyz";
        override_local_dns = false;
      };
      node.expiry = 0;
    };
  };

  services.nginx.virtualHosts = {
    "tail.riaru.xyz" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://localhost:${toString config.services.headscale.port}";
        proxyWebsockets = true;
      };
    };
  };

  networking.firewall.allowedTCPPorts = [80 443];
}
