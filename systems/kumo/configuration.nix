{lib, ...}: {
  imports = [
    ../../configs/groups/global.nix

    # Hardware
    ./hardware-configuration.nix
    ../../configs/programs/sops.nix # Make global
    ../../configs/programs/sudo.nix # Make global
    ../../configs/services/tailscale.nix # Make global

    # Private Services
    ../../configs/services/nfs.nix
    ../../configs/services/restic.nix
    ../../configs/services/blocky.nix
    ../../configs/services/inadyn.nix
    ../../configs/services/glance.nix

    # Public Services
    ../../configs/services/hydroxide.nix
    ../../configs/services/jellyfin/jellyfin.nix
    ../../configs/services/nextcloud.nix
    ../../configs/services/mastodon/mastodon.nix
    ../../configs/services/matrix.nix
    ../../configs/services/minecraft.nix

    # Users
    ../../users/riaru

    # Misc
    ../../configs/programs/fish/fish-system.nix
  ];

  home-manager.users.riaru = import ../../users/riaru/kumo/home.nix;

  environment = {
    variables = {
      NH_FLAKE = lib.mkForce "/data/nfs/riaru/Projects/nix-configs";
    };
    sessionVariables = {
      NH_FLAKE = lib.mkForce "/data/nfs/riaru/Projects/nix-configs";
    };
  };

  # Bootloader
  boot.loader.grub = {
    enable = true;
    device = "/dev/disk/by-id/ata-WDC_WD10EZEX-07WN4A0_WD-WCC6Y5JA163X";
    useOSProber = true;
  };

  networking.hostName = "kumo";

  system.stateVersion = "24.05";
}
