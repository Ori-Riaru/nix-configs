{
  pkgs,
  settings,
  ...
}: {
  home.packages = with pkgs; [
    direnv
  ];

  imports = [
    ./extensions.nix
    ./usersettings.nix
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    profiles.default = {
      enableUpdateCheck = false;
    };
  };
}
