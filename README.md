# My NixOS Configuration

These are my personal Nixos configurations.

# Structure

- `flake.nix`: Entrypoint for System and Home Manager configurations
- `system` System configuration usable with `nh os switch`
    - `common`: configurations shared across multiple system 
        - `global`:  configurations shared across all systems
        - `features`: optional configurations shared across some configurations
    - `lain`: Desktop PC Configuration
    - `shizuku`: Laptop Configuration
    - `fujin`: Server Configuration
        - `services`: Services hosted on this machine
- `user/riaru`: home-manager configuration usable with `nh home switch`
    - `global`: home-manager configurations shared across all machines
    - `programs`: optional programs installed and configured with home-manager
- `packages`: custom packages for programs unavailable from nixpkgs
- `overlays`

## Features

- KDE / (karousel, krohnkite) / touchegg

<!-- TODO: add demo -->

- Firefox

<!-- TODO: add demo -->

- VSCodium

<!-- TODO: add demo -->

- Kitty / Fish / Starship / Zoxide 

<!-- TODO: add demo -->

- Discord

<!-- TODO: add demo -->

- Spotify

<!-- TODO: add demo -->

- Obsidian

<!-- TODO: add demo -->

