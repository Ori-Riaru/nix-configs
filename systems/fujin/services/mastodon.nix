# create user
# sudo -u mastodon mastodon-tootctl accounts create $(whoami) --email=$(whoami)@localhost --confirmed --role=Owner
# Approve account
# sudo -u mastodon mastodon-tootctl accounts approve $(whoami)
# Change password
# mastodon-tootctl accounts modify --reset-password my_user
{}: {
  security.acme = {
    acceptTerms = true;
    defaults.email = "riaruazaki@proton.me";
  };
  services.mastodon = {
    enable = true;
    localDomain = "riaru.undo.it"; # Replace with your own domain
    configureNginx = true;
    smtp.fromAddress = "riaruazaki@proton.me"; # Email address used by Mastodon to send emails, replace with your own
    extraConfig.SINGLE_USER_MODE = "true";
    streamingProcesses = 3; # Number of processes used by the mastodon-streaming service. recommended is the amount of your CPU cores minus one.
  };
  networking.firewall.allowedTCPPorts = [80 443];
}
