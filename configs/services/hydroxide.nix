{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    hydroxide
  ];

  networking.firewall.allowedTCPPorts = [1143];

  users = {
    groups.hydroxide = {};
    users.hydroxide = {
      isSystemUser = true;
      group = "hydroxide";
      home = "/var/lib/hydroxide";
      createHome = true;
    };
  };

  systemd.services.hydroxide = {
    description = "Hydroxide";
    wantedBy = ["multi-user.target"];
    after = ["network.target"];

    serviceConfig = {
      ExecStart = "${pkgs.hydroxide}/bin/hydroxide -smtp-host 0.0.0.0 -smtp-port 1025 -imap-host 0.0.0.0 -imap-port 1143 -disable-carddav serve";
      Restart = "on-failure";
      RestartSec = 5;
      User = "hydroxide";
      Group = "hydroxide";
    };
  };
}
