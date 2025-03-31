# create user
# sudo -u mastodon mastodon-tootctl accounts create $(whoami) --email=$(whoami)@localhost --confirmed --role=Owner
# Approve account
# sudo -u mastodon mastodon-tootctl accounts approve $(whoami)
# Change password
# mastodon-tootctl accounts modify --reset-password my_user
{...}: {
  security.acme = {
    acceptTerms = true;
    defaults.email = "ori-riaru@proton.me";
  };
  services.mastodon = {
    enable = true;
    localDomain = "my.v0id.nl"; # Replace with your own domain
    configureNginx = true;
    smtp.fromAddress = "ori-riaru@proton.me";
    extraConfig.SINGLE_USER_MODE = "true";
    # Number of processes used by the mastodon-streaming service. recommended is the amount of your CPU cores minus one.
    streamingProcesses = 3;
  };

  networking.firewall.allowedTCPPorts = [80 443];
}
