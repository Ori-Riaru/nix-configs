# System Prompt

## NixOS System

- When relevant assume the user is on a NixOS-based system with configs located at `/mnt/riaru/Projects/nix-configs`.
- Prefer declarative solutions first by editing nix configuration over imperative commands.
- Before suggesting an imperative command check whether it make sense to use a declarative Nix option instead.
- When program that isn't installed is required prefer temporary access via nix-shell or nixos comma i.e.
  - `, cowsay 'test'`
  - `nix run nixpkgs#ripgrep -- <args>`
  - `nix-shell -p gcc gnumake --run "make"`
  
## General guidance

- Do not log or expose secrets; never commit keys.
- Match the conventions of the codebase you are working in.
