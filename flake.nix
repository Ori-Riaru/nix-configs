{
  description = "Riaru's System Configuration";

  inputs = {
    # === Repositories ===
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";
    nixpkgs-stable.url = "github:nixos/nixpkgs/release-26.05";

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

    # === Programs ===

    niri = {
      url = "github:epireyn/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixpkgs-stable.follows = "nixpkgs-stable";
    };

    elephant = {
      url = "github:abenz1267/elephant";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    walker = {
      url = "github:abenz1267/walker/dev";
      inputs.elephant.follows = "elephant";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri-minimap = {
      url = "github:Ori-Riaru/niri-minimap";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # copyparty = {
    #   url = "github:9001/copyparty";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # unreal-engine = {
    #   url = "github:BridgerB/unreal-engine";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # hyprland = {
    #   url = "github:hyprwm/Hyprland";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # === Modules ===

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nur.follows = "nur";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # plasma-manager = {
    #   url = "github:nix-community/plasma-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   inputs.home-manager.follows = "home-manager";
    # };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    settings = {
      # === Primary User Settings ===

      username = "riaru";
      usernameFull = "Ori Riaru";
      email = "ori-riaru@proton.me";

      # === General ===

      keyboard = "dvorak"; # Only changes the layout not shortcuts
      configPath = "/mnt/nfs/riaru/Projects/nix-configs";
      secrets-dir = "/mnt/nfs/riaru/Projects/nix-configs/users/riaru/secrets";
      serverLocalIP = "192.168.1.101";
      serverTailscaleIP = "100.103.185.35";
      nasPath = "/mnt/nfs/riaru";
    };

    # === Default Theme ===

    # Default theme settings that are propagated across all systems. Theme
    # settings can be overwritten at either a per system or per user level

    theme = rec {
      spacing-xs = 1;
      spacing-s = 3;
      spacing-m = 6;
      spacing-l = 12;
      spacing-xl = 24;
      spacing-xxl = 48;

      gap = 3;

      radius = 6;
      radius-s = 3;

      border-width-s = 2;
      border-width = 3;

      font = "Inter";
      fontMonospace = "JetBrainsMono Nerd Font";

      accent-bright = purple-bright;
      accent = purple;
      accent-dim = purple-dim;
      accent-dark = purple-dark;
      secondary-bright = blue-bright;
      secondary = blue;
      secondary-dim = blue-dim;
      secondary-dark = blue-dark;

      white = "#FFFFFF";
      text = "#DDDDDD";
      subtext = "#999999";
      muted = "#666666";
      hidden = "#303030";
      float = "#2c2c2c";
      overlay = "#222222";
      card = "#181818";
      section = "#141414";
      base = "#080808";
      black = "#000000";

      red-dark = "#331617";
      red-dim = "#573033";
      red = "#eb767e";
      red-bright = "#f5a9ae";

      orange-dark = "#322117";
      orange-dim = "#583d31";
      orange = "#f3a18d";
      orange-bright = "#f8c9bb";

      yellow-dark = "#302712";
      yellow-dim = "#564b28";
      yellow = "#f4da9d";
      yellow-bright = "#fff0ab";

      green-dark = "#162d1b";
      green-dim = "#325841";
      green = "#87d99a";
      green-bright = "#b2ecc0";

      teal-dark = "#123027";
      teal-dim = "#31594c";
      teal = "#72d9aa";
      teal-bright = "#a6ebcb";

      cyan-dark = "#173034";
      cyan-dim = "#34585e";
      cyan = "#88d1d8";
      cyan-bright = "#b7e6ea";

      blue-dark = "#1a2b3d";
      blue-dim = "#395674";
      blue = "#88bddf";
      blue-bright = "#b7d6ec";

      purple-dark = "#392d60";
      purple-dim = "#555194";
      purple = "#b0aafc";
      purple-bright = "#d0cbff";

      pink-dark = "#3b1d2d";
      pink-dim = "#613b4f";
      pink = "#f4a0c9";
      pink-bright = "#ffc7de";

      brown-dark = "#322624";
      brown-dim = "#534441";
      brown = "#ab8a82";
      brown-bright = "#c8ada8";
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
    packages =
      forAllSystems
      (system: import ./packages nixpkgs.legacyPackages.${system});

    overlays = import ./overlays {inherit inputs outputs;};

    nixosConfigurations = {
      # Desktop
      lain = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs settings theme;};
        modules = [
          ./systems/lain/configuration.nix
        ];
      };

      # Laptop
      slate = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs settings theme;};
        modules = [
          ./systems/slate/configuration.nix
        ];
      };

      # Server
      kumo = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs settings theme;};
        modules = [
          ./systems/kumo/configuration.nix
        ];
      };
    };

    templates = {
      web.path = ./starters/web;
      cpp.path = ./starters/cpp;
      opengl.path = ./starters/opengl;
      r.path = ./starters/r;
      r-notebook.path = ./starters/r-notebook;
      rust.path = ./starters/rust;
      java.path = ./starters/java;
      python.path = ./starters/python;
      python-notebook.path = ./starters/python-notebook;
      typescript.path = ./starters/typescript;
      kernel-module.path = ./starters/kernel-module;
    };

    # Shortcuts for nix repl
    lain = self.nixosConfigurations.lain;
    slate = self.nixosConfigurations.slate;
    kumo = self.nixosConfigurations.kumo;
    lain-home = self.nixosConfigurations.lain.config.home-manager.users;
    slate-home = self.nixosConfigurations.slate.config.home-manager.users;
    kumo-home = self.nixosConfigurations.kumo.config.home-manager.users;
    settings = settings;
    nixpkgs = nixpkgs;
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  };
}
