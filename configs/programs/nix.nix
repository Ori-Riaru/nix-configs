{
  pkgs,
  settings,
  ...
}: {
  home.packages = with pkgs; [
    nixd
    nix-init
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableBashIntegration = true;
  };

  programs.nix-init = {
    enable = true;
    settings = {
      maintainers = [(builtins.replaceStrings [" "] [""] settings.usernameFull)];
    };
  };
}
