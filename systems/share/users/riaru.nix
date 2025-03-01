{
  pkgs,
  settings,
  ...
}: {
  config.system.activationScripts.createIcon = "ln -sfn /home/riaru/Projects/nix-configs/systems/share/users/riaru/avatar.jpeg /var/lib/AccountsService/icons/tye";

  users.users.${settings.username} = {
    icon = ./avatar.jpeg;

    initialPassword = "ChangeMe";
    isNormalUser = true;
    shell = pkgs.fish;
    description = "${settings.username-full}";

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJKa+gTB3lRBtJpG4GEeP7nFpuXEb7mglmN9bR1Q/Y0S riaru@shizuku"
    ];

    extraGroups = ["networkmanager" "wheel" "docker"];

    packages = [pkgs.home-manager];
  };
}
