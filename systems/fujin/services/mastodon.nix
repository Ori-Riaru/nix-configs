# create user
# chmod 755 /home/riaru
# sudo -u mastodon mastodon-tootctl accounts create $(whoami) --email=$(whoami)@localhost --confirmed --role=Owner
# sudo -u mastodon mastodon-tootctl accounts approve $(whoami)
# sudo mastodon-tootctl accounts modify --reset-password $(whoami)
{pkgs, ...}: {
  security.acme = {
    acceptTerms = true;
    defaults.email = "ori-riaru@proton.me";
  };
  services.mastodon = {
    enable = true;
    localDomain = "riaru.undo.it";
    configureNginx = true;
    smtp.fromAddress = "ori-riaru@proton.me";
    extraConfig.SINGLE_USER_MODE = "true";
    streamingProcesses = 3;
  };
  networking.firewall.allowedTCPPorts = [80 443];

  services.mastodon.package = pkgs.mastodon.overrideAttrs (old: {
    mastodonModules = old.mastodonModules.overrideAttrs (old: {
      # FIXME: Remove once fixed in nixpkgs. See https://github.com/NixOS/nixpkgs/issues/380366
      postBuild = ''
        # Remove workspace "package" as it contains broken symlinks
        rm -r ~/node_modules/@mastodon
      '';
    });
  });
}
