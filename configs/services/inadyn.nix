{config, ...}: {
  services.inadyn = {
    enable = true;
    settings = {
      provider."afraid.org" = {
        hostname = [
          "livekit.v0id.nl"
          "my.v0id.nl"
          "signal.v0id.nl"
          "riaru.undo.it"
          "riaru.home.kg"
          # "riaru.developer.li"
        ];
        username = "riaru";
        include = config.sops.templates."afraid_pass.conf".path;
      };
      period = 300; # 5 minutes
    };
  };
}
