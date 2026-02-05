{config, ...}: {
  services.inadyn = {
    enable = true;
    settings = {
      provider."afraid.org" = {
        hostname = ["my.v0id.nl" "riaru.undo.it" "riaru.developer.li" "riaru.home.kg"];
        username = "riaru";
        include = config.sops.templates."afraid_pass.conf".path;
      };
      period = 300; # 5 minutes
    };
  };
}
