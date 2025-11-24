{
  inputs,
  config,
  ...
}: {
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";

    age = {
      sshKeyPaths = ["${config.home.homeDirectory}/.ssh/id_ed25519"];
      keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
      generateKey = true;
    };

    secrets = {
      "kasa_pass" = {};
      "dashboard_url" = {};
    };
  };
}
