# My NixOS Configuration

My personal Nixos configurations. They are not intended to be used by others however feel free to take parts or ideas for your own configuration. Most application have been styled to match my color scheme [Neutral Dark](https://github.com/Ori-Riaru/neutral-dark).

## Structure

- [`configs/`](./configs/): Reusable configurations

  - [`groups/`](./configs/groups/): Groups of programs or services which are commonly imported together
  - [`programs/`](./configs/programs/): Programs and their configurations which can be imported in a system conifguration.nix or a users home.nix.
  - [`services/`](./configs/services/): Services and their configurations which can be imported in system configuration.nix.
  - [`system/`](./configs/system/): Nix and system configurations not specific to a program or service

- [`systems/`](./systems/): System configuration (built with `nh os switch`)

  - [`lain/`](./systems/lain/): System configurations imported for my desktop
  - [`slate/`](./systems/slate/): System configuration imported for my laptop
  - [`fujin/`](./systems/fujin/): System configurations imported for my server

- [`users/`](./users/): Home Manager configurations for each user (built with `nh home switch`)

  - [`riaru/`](./users/riaru/)
    - [`lain/`](./users/riaru/lain)- Home Manager configurations imported to my desktop
    - [`slate/`](./users/riaru/slate)` - Home Manager configurations imported to my laptop
    - [`fujin/`](./users/riaru/fujin) - Home Manager configuration imported to my desktop

- [`starters/`](./starters/): Project starting templates including flake and direnv
- [`packages/`](./packages/): Self package software not available in nix packages
- [`overlays/`](./overlays/): Patches and version overrides for packages
- [`secrets/`](./secrets/): Encrypted credentials, passwords, keys, etc
- [`flake.nix`](./flake.nix): Global Settings and entrypoint for the OS and Home Manager configurations

## Featured Configurations

- [KDE](./modules/programs/kde/) / (karousel, krohnkite) / [touchegg](./modules/programs/touchegg.nix)

![kde preview](./.github/kde-preview.gif)

- [Firefox](./modules/programs/firefox/)

TODO: add demo

- [VSCodium](./modules/programs/vscodium/)

![vscodium preview](./.github/vscodium-preview.png)

- [Kitty](./modules/programs/kitty.nix) / [Fish](./modules/programs/fish.nix) / [Starship](./modules/programs/starship.nix) / [Zoxide](./modules/programs/zoxide.nix)

![kitty preview](./.github/kitty-preview.png)

- [Discord](./modules/programs/discord.nix)

TODO: add demo

- [Spotify](./modules/programs/spotify/)

![spotify preview](./.github/spotify-preview.png)

- [Obsidian](./modules/programs/obsidian.nix)

![github preview](./.github/obsidian-preview.png)

- Selfhosted Services ([Mastodon](./modules/services/mastodon/), NextCloud)

![mastodon preview](./.github/mastodon-preview.png)
