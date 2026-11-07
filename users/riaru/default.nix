{
  pkgs,
  settings,
  config,
  ...
}: {
  imports = [
    ../../configs/system/avatar.nix
  ];

  sops.secrets.riaru_pass.neededForUsers = true;
  users.mutableUsers = false;

  users.users.${settings.username} = {
    description = "${settings.usernameFull}";
    icon = ./avatar.png;
    isNormalUser = true;
    shell = pkgs.fish;
    hashedPasswordFile = config.sops.secrets.riaru_pass.path;
    extraGroups = ["networkmanager" "wheel" "input" "dialout" "plugdev" "libvirtd"];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJEYpUzmHss3lwkSxrA9WCx6dQZynVX3KQwWOGjY7jU7 ori@riaru.xyz"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJEAAD4dhmMbBSTGcg+8TmAcJePsTgxuh9bETQJs5GGO riaru@kumo"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOyeGBIa7CxXB0b4pqNVQCm409s0ZDLA+i24Y+gpX5FT riaru@lain"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINlxYWwjG++2l8nJc0SHtN3KW4THiVuPt8CJFDGI/o+a riaru@slate"
    ];
  };
}
