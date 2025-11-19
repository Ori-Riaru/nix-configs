# MANUAL */Generate age key from ssh key
# nix run nixpkgs#ssh-to-age -- -private-key -i ~/.ssh/id_ed25519 > ~/.config/sops/age/keys.txt
{
  lib,
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  environment.systemPackages = with pkgs; [
    sops
  ];

  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    validateSopsFiles = false;

    age = {
      sshKeyPaths = ["/home/riaru/.ssh/id_ed25519"];
      keyFile = "/home/riaru/.config/sops/age/keys.txt";
      generateKey = true;
    };

    secrets = {
      "nextcloud_admin_pass" = {};
      "riaru_pass" = {};
      "afraid_pass" = {};
      "restic_pass" = {};
      "copyparty_pass" = lib.mkIf (config.services ? "copyparty" && config.services.copyparty.enable) {
        owner = config.services.copyparty.user;
        group = config.services.copyparty.group;
      };
    };

    templates = lib.mkIf config.services.inadyn.enable {
      "afraid_pass.conf" = {
        content = ''
          password = "${config.sops.placeholder.afraid_pass}"
        '';
        owner = "inadyn";
      };
    };
  };
}
