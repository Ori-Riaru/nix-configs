# create user
# sudo -u mastodon mastodon-tootctl accounts create $(whoami) --email=$(whoami)@local>
# Approve account
# sudo -u mastodon mastodon-tootctl accounts approve $(whoami)
# Change password
# mastodon-tootctl accounts modify --reset-password my_user
{
  pkgs,
  settings,
  config,
  lib,
  ...
}: let
  mastodonPackage = pkgs.mastodon.override {
    patches = [./charlimit.patch];
  };
in {
  security.acme = {
    acceptTerms = true;
    defaults.email = settings.email;
  };

  services.mastodon = {
    enable = true;

    localDomain = "riaru.xyz";
    configureNginx = false;
    smtp.fromAddress = settings.email;

    extraConfig = {
      SINGLE_USER_MODE = "true";
      WEB_DOMAIN = "mas.riaru.xyz";
      ALTERNATE_DOMAINS = "kumo.tailcba954.ts.net";
    };
    streamingProcesses = 2;

    package = mastodonPackage;
  };

  services.nginx = {
    enable = true;
    recommendedProxySettings = true;

    virtualHosts."mas.riaru.xyz" = {
      root = "${mastodonPackage}/public/";
      forceSSL = true;
      enableACME = true;

      extraConfig = "client_max_body_size 100m;";

      locations = {
        "/system/".alias = "/var/lib/mastodon/public-system/";

        "/" = {
          tryFiles = "$uri @proxy";
        };

        "@proxy" = {
          proxyPass = "http://unix:/run/mastodon-web/web.socket";
          proxyWebsockets = true;
        };
        "/api/v1/streaming" = {
          proxyPass = "http://mastodon-streaming";
          proxyWebsockets = true;
        };
      };
    };

    upstreams.mastodon-streaming = {
      extraConfig = "least_conn;";
      servers = builtins.listToAttrs (
        map (i: {
          name = "unix:/run/mastodon-streaming/streaming-${toString i}.socket";
          value = {};
        }) (lib.range 1 config.services.mastodon.streamingProcesses)
      );
    };
  };

  users.groups.mastodon.members = [config.services.nginx.user];

  networking.firewall.allowedTCPPorts = [80 443];
}
