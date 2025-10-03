{
  pkgs,
  settings,
  ...
}: {
  users.users.${settings.username} = {
    initialPassword = "12345678";
    isNormalUser = true;
    shell = pkgs.fish;
    description = "${settings.usernameFull}";

    openssh.authorizedKeys.keys = [
    ];

    extraGroups = ["networkmanager" "wheel" "docker" "input"];

    packages = [pkgs.home-manager];
  };
}
