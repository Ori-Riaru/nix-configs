{pkgs, ...}: {
  home.packages = with pkgs; [
    nixd
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableBashIntegration = true;
  };
}
