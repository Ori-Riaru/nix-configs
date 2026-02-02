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
    - [`lain/`](./users/riaru/lain)- Home Manager configurations imported to my desktop
    - [`slate/`](./users/riaru/slate)` - Home Manager configurations imported to my laptop
    - [`kumo/`](./users/riaru/kumo) - Home Manager configuration imported to my desktop

- [`starters/`](./starters/): Project starting templates including flake and direnv
- [`packages/`](./packages/): Self package software not available in nix packages
- [`overlays/`](./overlays/): Patches and version overrides for packages
- [`secrets/`](./secrets/): Encrypted credentials, passwords, keys, etc

## Featured Configurations (TODO: outdated update)

- [Niri](./configs/programs/niri/niri.nix) / [Waybar](./configs/programs/waybar/waybar.nix) / [Walker](./configs/programs/walker.nix)

![niri preview](./.github/kde-preview.gif)

- [Vivaldi](./configs/programs/vivaldi.nix)

![Vivaldi Preview](./.github/vivaldi-preview.png)

- [VSCodium](./configs/programs/vscodium/)

![vscodium preview](./.github/vscodium-preview.png)

- [Ghostty](./configs/programs/ghostty.nix) / [Fish](./configs/programs/fish.nix) /  [Starship](./configs/programs/starship.nix) / [Zoxide](./configs/programs/zoxide.nix) / [etc](./configs/groups/cli-base.nix)

![ghostty preview](./.github/ghostty-preview.png)

- [Discord](./configs/programs/discord.nix)

TODO: add demo

- [Spotify](./configs/programs/spotify/spotify.nix)

![spotify preview](./.github/spotify-preview.png)

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

| Fonts     |                                                    | \|\| | Spacing  |     |                            |
| --------- | -------------------------------------------------- | ---- | -------- | --- | -------------------------- |
| UI        | [Inter](https://fonts.google.com/specimen/Inter)   | \|\| | `gap`    | 5px | Gap Between Major Sections |
| Monospace | [JetBrainMono](https://www.jetbrains.com/lp/mono/) | \|\| | `radius` | 8px | Radius of Cards            |

### Color Palette

| Color              | Hex                                                                                                      | Swatch                                                       | Usage                                                             |
| ------------------ | -------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ | ----------------------------------------------------------------- |
| Text               |
| `Text`             | <div style="color: white; background-color: #111111; padding: 15px; border-radius: 6px ">#ffffff</div>   | ![Text](./.github/swatches/text.png)                         | Basic text, Headers                                               |
| `Subtext`          | <div style="color: #aaaaaa; background-color: #111111; padding: 15px; border-radius: 6px ">#aaaaaa</div> | ![Subtext](./.github/swatches/subtext.png)                   | Subtext, Placeholder, Comments                                    |
| `Hidden`           | <div style="color: #606060; background-color: #111111; padding: 15px; border-radius: 6px ">#606060</div> | ![Hidden](./.github/swatches/hidden.png)                     | Disabled, Hidden                                                  |
| Backgrounds        |
| `base`             | <div style="color: white; background-color: #000000; padding: 15px; border-radius: 6px ">#000000</div>   | ![Base](./.github/swatches/base.png)                         | Window backgrounds                                                |
| `section`          | <div style="color: white; background-color: #111111; padding: 15px; border-radius: 6px ">#111111</div>   | ![Section](./.github/swatches/section.png)                   | Major Section, Content Only Window                                |
| `card`             | <div style="color: white; background-color: #181818; padding: 15px; border-radius: 6px ">#181818</div>   | ![Card](.github/swatches/card.png)                           | Card, Input, highlighted button                               |
| `overlay`          | <div style="color: white; background-color: #222222; padding: 15px; border-radius: 6px ">#222222</div>   | ![Overlay](./.github/swatches/overlay.png)                   | Search Overlay,                                                   |
| Customizations     |
| `accent`           | <div style="color: white; background-color: #a386ff; padding: 15px; border-radius: 6px ">#a386ff</div>   | ![Accent](./.github/swatches/accent.png)                     | Customizable Primary Accent                                       |
| `accent-secondary` | <div style="color: white; background-color: #83bbff; padding: 15px; border-radius: 6px ">#83bbff</div>   | ![Accent-Secondary](./.github/swatches/accent-secondary.png) | Customizable Secondary Accent                                    |
| `accent-tertiary`  | <div style="color: black; background-color: #fefb77; padding: 15px; border-radius: 6px ">#fefb77</div>   | ![Accent-Tertiary](./.github/swatches/accent-tertiary.png)   | Customizable Tertiary Accent                                     |
| Colors             |
| `Red`              | <div style="color: white; background-color: #fe5970; padding: 15px; border-radius: 6px ">#fe5970</div>   | ![Red](./.github/swatches/red.png)                           | Error, Remove, Close, Delete, Tags (HTML/XML), Annotations        |
| `Orange`           | <div style="color: white; background-color: #ffa062; padding: 15px; border-radius: 6px ">#ffa062</div>   | ![Orange](./.github/swatches/orange.png)                     | Warning, Numbers                                                  |
| `Yellow`           | <div style="color: black; background-color: #fefb77; padding: 15px; border-radius: 6px ">#fefb77</div>   | ![Yellow](./.github/swatches/yellow.png)                     | Info, Help                                                        |
| `Green`            | <div style="color: black; background-color: #99ff82; padding: 15px; border-radius: 6px ">#99ff82</div>   | ![Green](./.github/swatches/green.png)                       | Strings                                                           |
| `Teal`             | <div style="color: black; background-color: #80ffc1; padding: 15px; border-radius: 6px ">#80ffc1</div>   | ![Teal](./.github/swatches/teal.png)                         | Success, New, Add,                                                |
| `Cyan`             | <div style="color: black; background-color: #7ef8fe; padding: 15px; border-radius: 6px ">#7ef8fe</div>   | ![Cyan](./.github/swatches/cyan.png)                         | Attributes, Properties (HTML/CSS/JSX)                             |
| `Blue`             | <div style="color: white; background-color: #83bbff; padding: 15px; border-radius: 6px ">#83bbff</div>   | ![Blue](./.github/swatches/blue.png)                         | Neutral, Function Names, Declarations                             |
| `Purple`           | <div style="color: white; background-color: #a386ff; padding: 15px; border-radius: 6px ">#a386ff</div>   | ![Purple](./.github/swatches/purple.png)                     | Modified, Change, Edit, Keywords, Reserved Words, Important Terms |
| `Pink`             | <div style="color: black; background-color: #fe99fe; padding: 15px; border-radius: 6px ">#fe99fe</div>   | ![Pink](./.github/swatches/pink.png)                         | Operators (+, -, \*, etc.)                                        |
| `White`            | <div style="color: black; background-color: #ffffff; padding: 15px; border-radius: 6px ">#ffffff</div>   | ![White](./.github/swatches/white.png)                       |                                                                   |
| `Black`            | <div style="color: white; background-color: #000000; padding: 15px; border-radius: 6px ">#000000</div>   | ![Black](./.github/swatches/black.png)                       |                                                                   |
