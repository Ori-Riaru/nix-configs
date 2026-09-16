# My NixOS Configuration

My personal Nixos configurations. They are not intended to be used by others however feel free to take parts or ideas for your own configuration. Most application have been styled to match my color scheme Neutral Dark

## Structure

- [`flake.nix`](./flake.nix): Global Settings and entrypoint for the System and Home Manager configurations
- [`configs/`](./configs/): Reusable configurations
  - [`groups/`](./configs/groups/): Groups of programs or services which are commonly imported together
  - [`programs/`](./configs/programs/): Programs and their configurations which can be imported in a system configuration.nix or a users home.nix
  - [`services/`](./configs/services/): Services and their configurations which can be imported in system configuration.nix
  - [`system/`](./configs/system/): Nix and system configurations not specific to a program or service

- [`systems/`](./systems/): System configuration (built with `nh os switch`)
  - [`lain/`](./systems/lain/): System configurations imported for my desktop
  - [`slate/`](./systems/slate/): System configuration imported for my laptop
  - [`kumo/`](./systems/kumo/): System configurations imported for my server

- [`users/`](./users/): Home Manager configurations for each user (built with `nh home switch`)
  - [`riaru/`](./users/riaru/)
    - [`lain/`](./users/riaru/lain) - Home Manager configurations imported to my desktop
    - [`slate/`](./users/riaru/slate) - Home Manager configurations imported to my laptop
    - [`kumo/`](./users/riaru/kumo) - Home Manager configuration imported to my server

- [`starters/`](./starters/): Project starting templates including flake and direnv
- [`packages/`](./packages/): Self package software not available in nix packages
- [`overlays/`](./overlays/): Patches and version overrides for packages
- [`secrets/`](./secrets/): Encrypted credentials, passwords, keys, etc

## Features

### Desktop

- [Niri](./configs/programs/niri/niri.nix) / [Waybar](./configs/programs/waybar/waybar.nix) / [Walker](./configs/programs/walker.nix)

![niri preview](./.github/niri-preview.png)

### Default Apps

- [Vivaldi](./configs/programs/vivaldi/vivaldi.nix)

![Vivaldi Preview](./.github/vivaldi-preview.png)

- [VSCodium](./configs/programs/vscodium/)

![vscodium preview](./.github/vscodium-preview.png)

- [Ghostty](./configs/programs/ghostty.nix) / [Fish](./configs/programs/fish/fish.nix) / [Starship](./configs/programs/starship.nix) / [Zoxide](./configs/programs/zoxide.nix) / [etc](./configs/groups/cli-apps.nix)

![ghostty preview](./.github/ghostty-preview.png)

- [Obsidian](./configs/programs/obsidian.nix)

![Obsidian preview](./.github/obsidian-preview.png)

## Self-hosted Services

- [Mastodon](./configs/services/mastodon/mastodon.nix)

![mastodon preview](./.github/mastodon-preview.png)

- [NextCloud](./configs/services/nextcloud.nix)

- [NFS shares](./configs/services/nfs.nix)

- [Blocky](./configs/services/blocky.nix)

- [Inadyn](./configs/services/inadyn.nix)

### Keyboard Layout & Shortcuts

[Kanata](./configs/programs/kanata.nix)

![34 Key split keyboard layout](./.github/keymap.svg)

## Theming

Many application and websites have been themed to match my custom color scheme

| Fonts     |                                                    | \   | \   |     | Spacing  |     |                            |
| -----------| ----------------------------------------------------| -----| -----| -----| ----------| -----| ----------------------------|
| UI        | [Inter](https://fonts.google.com/specimen/Inter)   | \   | \   |     | `gap`    | 0px | Gap Between Major Sections |
| Monospace | [JetBrainMono](https://www.jetbrains.com/lp/mono/) | \   | \   |     | `radius` | 2px | Radius of Cards            |

<details><summary>Full Color List and Descriptions</summary>

| Color              | Hex     | Swatch                                                       | Usage                                                             |     |
| --------------------| ---------| --------------------------------------------------------------| -------------------------------------------------------------------| -----|
| Text               |         |                                                              |                                                                   |     |
| `Text`             | #eeeeee | ![Text](./.github/swatches/text.png)                         | Basic text, Headers                                               |     |
| `Subtext`          | #aaaaaa | ![Subtext](./.github/swatches/subtext.png)                   | Subtext, Placeholder, Comments                                    |     |
| `Hidden`           | #606060 | ![Hidden](./.github/swatches/hidden.png)                     | Disabled, Hidden                                                  |     |
| Backgrounds        |         |                                                              |                                                                   |     |
| `base`             | #000000 | ![Base](./.github/swatches/base.png)                         | Window backgrounds                                                |     |
| `section`          | #111111 | ![Section](./.github/swatches/section.png)                   | Major Section, Content Only Window                                |     |
| `card`             | #181818 | ![Card](.github/swatches/card.png)                           | Card, Input, highlighted button                                   |     |
| `overlay`          | #222222 | ![Overlay](./.github/swatches/overlay.png)                   | Search Overlay,                                                   |     |
| Customizations     |         |                                                              |                                                                   |     |
| `accent`           | #a386ff | ![Accent](./.github/swatches/accent.png)                     | Customizable Primary Accent                                       |     |
| `accent-secondary` | #83bbff | ![Accent-Secondary](./.github/swatches/accent-secondary.png) | Customizable Secondary Accent                                     |     |
| `accent-tertiary`  | #fefb77 | ![Accent-Tertiary](./.github/swatches/accent-tertiary.png)   | Customizable Tertiary Accent                                      |     |
| Colors             |         |                                                              |                                                                   |     |
| `Red`              | #fe5970 | ![Red](./.github/swatches/red.png)                           | Error, Remove, Close, Delete, Tags (HTML/XML), Annotations        |     |
| `Orange`           | #ffa062 | ![Orange](./.github/swatches/orange.png)                     | Warning, Numbers                                                  |     |
| `Yellow`           | #fefb77 | ![Yellow](./.github/swatches/yellow.png)                     | Info, Help                                                        |     |
| `Green`            | #99ff82 | ![Green](./.github/swatches/green.png)                       | Strings                                                           |     |
| `Teal`             | #80ffc1 | ![Teal](./.github/swatches/teal.png)                         | Success, New, Add,                                                |     |
| `Cyan`             | #7ef8fe | ![Cyan](./.github/swatches/cyan.png)                         | Attributes, Properties (HTML/CSS/JSX)                             |     |
| `Blue`             | #83bbff | ![Blue](./.github/swatches/blue.png)                         | Neutral, Function Names, Declarations                             |     |
| `Purple`           | #a386ff | ![Purple](./.github/swatches/purple.png)                     | Modified, Change, Edit, Keywords, Reserved Words, Important Terms |     |
| `Pink`             | #fe99fe | ![Pink](./.github/swatches/pink.png)                         | Operators (+, -, \*, etc.)                                        |     |
| `White`            | #ffffff | ![White](./.github/swatches/white.png)                       |                                                                   |     |
| `Black`            | #000000 | ![Black](./.github/swatches/black.png)                       |                                                                   |     |

</details>
