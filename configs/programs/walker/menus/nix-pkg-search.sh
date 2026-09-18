#!/usr/bin/env bash
# Ask for a package/option name and open it on mynixos.com so the snippet can
# be copied into a freshly scaffolded config. Used by the walker "Nix Config" menu.

set -euo pipefail

name=$(zenity --entry --title "Nix Package Lookup" --text "Search mynixos.com for a package or option:" --width 460 2>/dev/null) || exit 0
if [ -z "$name" ]; then
  exit 0
fi

enc=$(printf '%s' "$name" | jq -sRr @uri)
xdg-open "https://mynixos.com/search?q=${enc}"