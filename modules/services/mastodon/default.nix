# create user
# sudo -u mastodon mastodon-tootctl accounts create $(whoami) --email=$(whoami)@localhost --confirmed >
# Approve account
# sudo -u mastodon mastodon-tootctl accounts approve $(whoami)
# Change password
# mastodon-tootctl accounts modify --reset-password my_user
{pkgs, ...}: {
  security.acme = {
    acceptTerms = true;
    defaults.email = "ori-riaru@proton.me";
  };
  services.mastodon = {
    enable = true;
    localDomain = "my.v0id.nl";
    configureNginx = true;
    smtp.fromAddress = "ori-riaru@proton.me";
    extraConfig.SINGLE_USER_MODE = "true";
    streamingProcesses = 3;

    package = pkgs.callPackage "${pkgs.path}/pkgs/servers/mastodon" {
      patches = [./charlimit.patch];
    };
  };

  networking.firewall.allowedTCPPorts = [80 443];
}
