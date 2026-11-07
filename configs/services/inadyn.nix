{config, ...}: {
  services.inadyn = {
    enable = true;
    settings = {
      allow-ipv6 = false;
      provider = {
        "afraid.org" = {
          hostname = [
            "riaru.undo.it"
            "riaru.undo.it"
          ];
          username = "riaru";
          include = config.sops.templates."afraid_pass.conf".path;
        };
        "cloudflare.com" = {
          username = "riaru.xyz";
          hostname = [
            "riaru.xyz"
            "mas.riaru.xyz"
            "matrix.riaru.xyz"
            "livekit.riaru.xyz"
            "cloud.riaru.xyz"
            "derp.riaru.xyz"
            "mov.riaru.xyz"
            "git.riaru.xyz"
            "www.riaru.xyz"
            "ori.riaru.xyz"
          ];
          include = config.sops.templates."cloudflare_pass.conf".path;
        };
      };
      period = 600; # 10 minutes
    };
  };
}
