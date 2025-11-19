{
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.copyparty.nixosModules.default
  ];

  nixpkgs.overlays = [inputs.copyparty.overlays.default];

  services.copyparty = {
    enable = true;
    group = "copyparty";
    user = "copyparty";

    settings = {
      shr = "shares";

      i = "0.0.0.0";
    };

    accounts = {
      ori.passwordFile = config.sops.secrets.copyparty_pass.path;
    };

    volumes = {
      "/" = {
        path = "/data/copyparty";

        access = {
          rwmd = ["ori"];
        };
      };
    };
  };

  networking.firewall = {
    allowedTCPPorts = [80 443 3921 3923 3945 3990];
    allowedTCPPortRanges = [
      {
        from = 12000;
        to = 12099;
      }
    ];
    allowedUDPPorts = [69 1900 3969 5353];
  };
}
