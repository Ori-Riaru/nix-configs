{
  pkgs,
  settings,
  config,
  ...
}: {
  imports = [
    ../../configs/system/avatar.nix
  ];

  programs.fish.enable = true;

  sops.secrets.riaru_pass.neededForUsers = true;
  users.mutableUsers = false;

  users.users.${settings.username} = {
    icon = ./avatar.jpeg;
    isNormalUser = true;
    shell = pkgs.fish;
    hashedPasswordFile = config.sops.secrets.riaru_pass.path;
    description = "${settings.username-full}";

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPf7Rker14xM3UE6t0OK7HAzXcnPqHixlROW20iH3Jcr ori-riaru@proton.me"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINOOLwfJlOTbw13vefasXyluHJsiuA9NguSdNed9QE1k ori-riaru@proton.me"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJKa+gTB3lRBtJpG4GEeP7nFpuXEb7mglmN9bR1Q/Y0S riaru@shizuku"
    ];

    extraGroups = ["networkmanager" "wheel" "docker" "input"];

    packages = [pkgs.home-manager];
  };
}
