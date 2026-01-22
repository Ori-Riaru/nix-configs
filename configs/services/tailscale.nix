{
  # MANUAL: run "sudo tailscale up"
  services.tailscale.enable = true;

  # WORKAROUND: https://github.com/tailscale/tailscale/issues/4254
  powerManagement.resumeCommands = ''
    systemctl restart tailscaled
  '';
}
