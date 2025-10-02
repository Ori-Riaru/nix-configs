{
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.walker.homeManagerModules.walker
  ];

  home.packages = with pkgs; [
    libqalculate
    wl-clipboard
  ];

  programs.walker = {
    enable = true;
    runAsService = true;
  };

  systemd.user.services.elephant = {
    Unit = {
      After = lib.mkForce ["xdg-desktop-autostart.target"];
      PartOf = lib.mkForce ["xdg-desktop-autostart.target"];
    };
    Install = {
      WantedBy = lib.mkForce ["xdg-desktop-autostart.target"];
    };
  };

  systemd.user.services.walker = {
    Unit = {
      After = lib.mkForce ["xdg-desktop-autostart.target" "elephant.service"];
      Requires = lib.mkForce ["xdg-desktop-autostart.target"];
      PartOf = lib.mkForce ["xdg-desktop-autostart.target"];
    };
    Install = {
      WantedBy = lib.mkForce ["xdg-desktop-autostart.target"];
    };
  };

  nix = {
    package = pkgs.nix;
    settings = {
      extra-substituters = [
        "https://walker.cachix.org"
        "https://walker-git.cachix.org"
      ];
      extra-trusted-public-keys = [
        "walker.cachix.org-1:fG8q+uAaMqhsMxWjwvk0IMb4mFPFLqHjuvfwQxE4oJM="
        "walker-git.cachix.org-1:vmC0ocfPWh0S/vRAQGtChuiZBTAe4wiKDeyyXM0/7pM="
      ];
    };
  };
}
