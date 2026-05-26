{
  pkgs,
  settings,
  config,
  ...
}: {
  programs.fish.enable = true;

  imports = [
    # ../../configs/system/avatar.nix
  ];

  sops.secrets.riaru_pass.neededForUsers = true;
  users.mutableUsers = false;

  users.users.${settings.username} = {
    description = "${settings.usernameFull}";
    # icon = ./avatar.jpeg;
    isNormalUser = true;
    shell = pkgs.fish;
    hashedPasswordFile = config.sops.secrets.riaru_pass.path;
    extraGroups = ["networkmanager" "wheel" "docker" "input"];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPf7Rker14xM3UE6t0OK7HAzXcnPqHixlROW20iH3Jcr ori-riaru@proton.me"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINOOLwfJlOTbw13vefasXyluHJsiuA9NguSdNed9QE1k ori-riaru@proton.me"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINlxYWwjG++2l8nJc0SHtN3KW4THiVuPt8CJFDGI/o+a riaru@slate"
    ];

    packages = with pkgs; [home-manager git];
  };
}
