{
  config,
  settings,
  ...
}: {
  services.matrix-continuwuity = {
    enable = true;
    settings.global = {
      server_name = "signal.v0id.nl";
      allow_registration = true;
      allow_federation = true;
      allow_encryption = true;
      trusted_servers = ["matrix.org"];
    };
  };

  security.acme = {
    acceptTerms = true;
    defaults.email = settings.email;
  };

  networking.firewall.allowedTCPPorts = [80 443];

  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    recommendedOptimisation = true;
    recommendedGzipSettings = true;

    virtualHosts."signal.v0id.nl" = {
      enableACME = true;
      forceSSL = true;

      locations."/_matrix/" = {
        proxyPass = "http://127.0.0.1:6167";
      };

      locations."/.well-known/matrix/server" = {
        return = ''200 '{"m.server":"signal.v0id.nl:443"}' '';
        extraConfig = ''
          default_type application/json;
        '';
      };

      locations."/.well-known/matrix/client" = {
        return = ''200 '{"m.homeserver":{"base_url":"https://signal.v0id.nl"}}' '';
        extraConfig = ''
          default_type application/json;
          add_header Access-Control-Allow-Origin "*";
        '';
      };
    };
  };
}
