{
  description = "Riaru's System Configuration";

  inputs = {
    # Repositories
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/release-25.05";

    nur = {
      url = "github:nix-community/nur";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Programs
    xremap-flake = {
      url = "github:xremap/nix-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    elephant = {
      url = "github:abenz1267/elephant/6a18cc3cbdd3d85627c8f2eb10059f1a2148d972";
      # inputs.nixpkgs.follows = "nixpkgs";
    };

    walker = {
      url = "github:Ori-Riaru/walker/fix-crash-when-service";
      inputs.elephant.follows = "elephant";
      # inputs.nixpkgs.follows = "nixpkgs";
    };

    # Modifications
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    settings = rec {
      # --- Primary User Settings ---
      username = "riaru";
      usernameFull = "Ori Riaru";
      email = "ori-riaru@proton.me";

      # --- Themeing ---
      avatar = "/home/riaru/Projects/nix-configs/users/riaru/avatar.png";
      wallpaper = "/mnt/nfs/riaru/Projects/nix-configs/users/riaru/wallpaper.png";
      secrets-dir = "/home/riaru/Projects/nix-configs/users/riaru/secrets";

      accent = purple;
      secondary = blue;
      tertiary = yellow;

      gap = 4; # px
      radius = 6; # px

      text = "#ffffff";
      subtext = "#888888";
      hidden = "#555555";

      base = "#080808";
      section = "#111111";
      card = "#222222";

      red = "#ff596b";
      orange = "#ffa062";
      yellow = "#fffb77";
      green = "#99ff82";
      teal = "#80ffc1";
      cyan = "#7ef8fe";
      blue = "#83bbff";
      purple = "#a386ff";
      pink = "#fe99fe";
      brown = "#ba8d70";
      white = "#ffffff";
      grey = "#272727";
      black = "#353535";

      font = "Inter";
      fontMonospace = "JetBrainsMono Nerd Font";

      keyboard = "dvorak"; # This won't correct shortcuts, only change the layout

      serverLocalIP = "192.168.1.101";
      serverTailscaleIP = "100.103.185.35";
      nasPath = "/mnt/nfs/nas";
      configPath = "/mnt/nfs/riaru/Projects/nix-configs";
    };

    inherit (self) outputs;

    systems = [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];

    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    packages = forAllSystems (system: import ./packages nixpkgs.legacyPackages.${system});
    overlays = import ./overlays {inherit inputs outputs;};
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    nixosConfigurations = {
      # Desktop
      lain = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs settings;};
        modules = [
          ./systems/lain/configuration.nix
        ];
      };

      # Laptop
      slate = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs settings;};
        modules = [
          ./systems/slate/configuration.nix
        ];
      };

      # Server
      kumo = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs settings;};
        modules = [
          ./systems/kumo/configuration.nix
        ];
      };
    };

    homeConfigurations = {
      # Desktop
      "${settings.username}@lain" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs settings;};
        modules = [
          ./users/riaru/lain/home.nix
        ];
      };

      "${settings.username}@slate" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs settings;};
        modules = [
          ./users/riaru/slate/home.nix
        ];
      };

      # Server
      "${settings.username}@kumo" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs settings;};
        modules = [
          ./users/riaru/kumo/home.nix
        ];
      };
    };

    templates = {
      web.path = ./starters/web;
      cpp.path = ./starters/cpp;
      rust.path = ./starters/rust;
      java.path = ./starters/java;
      python.path = ./starters/python;
      typescript.path = ./starters/typescript;
      kernel-module.path = ./starters/kernel-module;
    };
  };
}
