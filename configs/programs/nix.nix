{
  pkgs,
  settings,
  lib,
  ...
}: {
  imports = [
    ./direnv.nix
  ];

  home.packages = with pkgs; [
    nixd
  ];

  nix.package = lib.mkForce pkgs.lixPackageSets.stable.lix;

  programs.nix-init = {
    enable = true;
    settings = {
      maintainers = [(builtins.replaceStrings [" "] [""] settings.usernameFull)];
    };
  };
}
