{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.walker.homeManagerModules.default
  ];

  nix.package = pkgs.nix;
  nix.settings = {
    substituters = [
      "https://walker.cachix.org"
      "https://walker-git.cachix.org"
    ];
    trusted-public-keys = [
      "walker.cachix.org-1:fG8q+uAaMqhsMxWjwvk0IMb4mFPFLqHjuvfwQxE4oJM="
      "walker-git.cachix.org-1:vmC0ocfPWh0S/vRAQGtChuiZBTAe4wiKDeyyXM0/7pM="
    ];
  };

  programs.walker = {
    enable = true;
    # Causes problems with xwayland server don't use
    # runAsService = true;
    config = {
      close_when_open = true;
    };
  };
}
