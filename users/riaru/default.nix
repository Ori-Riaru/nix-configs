{
  pkgs,
  settings,
  ...
}: {
  imports = [
    # ../../modules/_share/avatar.nix
  ];

  programs.fish.enable = true;

  users.users.${settings.username} = {
    # icon = ./avatar.jpeg;

    initialPassword = "ChangeMe";
    isNormalUser = true;
    shell = pkgs.fish;
    description = "${settings.username-full}";

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINOOLwfJlOTbw13vefasXyluHJsiuA9NguSdNed9QE1k ori-riaru@proton.me"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJKa+gTB3lRBtJpG4GEeP7nFpuXEb7mglmN9bR1Q/Y0S riaru@shizuku"
    ];

    extraGroups = ["networkmanager" "wheel" "docker" "input"];

    packages = [pkgs.home-manager];
  };
}
