{
  services.home-assistant = {
    enable = false;
    # extraComponents = [
    #   "esphome"
    #   "met"
    #   "radio_browser"
    #   "tplink"
    # ];

    # config = {
    #   default_config = {};
    #   http = {
    #     server_host = "::1";
    #     trusted_proxies = ["::1"];
    #     use_x_forwarded_for = true;
    #   };
    # };
  };

  # # Open firewall port for Home Assistant
  # networking.firewall.allowedTCPPorts = [80 443 8123];

  # # Nginx reverse proxy configuration with SSL/TLS using Let's Encrypt
  # services.nginx = {
  #   enable = true;
  #   recommendedProxySettings = true;
  #   virtualHosts."riaru.home.kg" = {
  #     forceSSL = true;
  #     enableACME = true;
  #     locations."/" = {
  #       proxyPass = "http://[::1]:8123";
  #       proxyWebsockets = true;
  #       extraConfig = ''
  #         proxy_buffering off;
  #       '';
  #     };
  #   };
  # };

  # security.acme = {
  #   email = "riaruazaki@proton.me";
  #   acceptTerms = true;
  # };
}
