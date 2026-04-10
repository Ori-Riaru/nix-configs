{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    hydroxide
  ];

  networking.firewall.allowedTCPPorts = [1143];

  systemd.services.hydroxide = {
    description = "Hydroxide ProtonMail bridge";
    wantedBy = ["multi-user.target"];
    after = ["network.target"];

    serviceConfig = {
      ExecStart = "${pkgs.hydroxide}/bin/hydroxide -imap-host 0.0.0.0 -imap-port 1143 imap";
      Restart = "on-failure";
    };
  };
}
