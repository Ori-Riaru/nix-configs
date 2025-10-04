{
  pkgs,
  settings,
  ...
}: {
  users.users.test-user = {
    description = "Test User";
    initialPassword = "12345678";
    isNormalUser = true;
    shell = pkgs.fish;

    openssh.authorizedKeys.keys = [
    ];

    extraGroups = ["networkmanager" "wheel" "docker" "input"];

    packages = with pkgs; [home-manager git];
  };
}
