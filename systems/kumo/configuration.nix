{lib, ...}: {
  imports = [
    ./hardware-configuration.nix

    ../../users/riaru

    ../../configs/groups/global.nix
    ../../configs/programs/sops.nix
    ../../configs/programs/sudo.nix

    ../../configs/services/tailscale.nix
    ../../configs/services/blocky.nix
    ../../configs/services/inadyn.nix

    ../../configs/services/nfs.nix
    ../../configs/services/restic.nix
    
    ../../configs/services/mastodon/mastodon.nix
    ../../configs/services/matrix.nix
    ../../configs/services/hydroxide.nix
    ../../configs/services/jellyfin.nix
    ../../configs/services/nextcloud.nix
    ../../configs/services/glance.nix
  ];

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
