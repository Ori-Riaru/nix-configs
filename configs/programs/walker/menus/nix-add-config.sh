#!/usr/bin/env bash
# Create a template config module in the nix-configs repo and open the
# containing folder in vscodium. Used by the walker "Nix Config" menu.
#
# Usage: nix-add-config <program|service|group|system> <home|system> [--template package|module|daemon|manual]

set -euo pipefail

CONFIG_PATH="/mnt/nfs/riaru/Projects/nix-configs"

usage() {
  notify-send "Nix Config" "Usage: nix-add-config <program|service|group|system> <home|system> [--template package|module|daemon|manual]"
}

if [ "$#" -lt 2 ]; then
  usage
  exit 1
fi

category="$1"
target="$2"
shift 2

case "$category" in
  program | service | group | system) ;;
  *) usage
    exit 1
    ;;
esac

case "$target" in
  home | system) ;;
  *) usage
    exit 1
    ;;
esac

TEMPLATE="manual"
while [ "$#" -gt 0 ]; do
  case "$1" in
    --template) TEMPLATE="$2"
      shift 2
      ;;
    *) notify-send "Nix Config" "Unknown option: $1"
      exit 1
      ;;
  esac
done

trap 'notify-send "Nix Config" "Failed to create template: $BASH_COMMAND" || true' ERR

case "$category" in
  program) subdir="programs" ;;
  service) subdir="services" ;;
  group) subdir="groups" ;;
  system) subdir="system" ;;
esac

dir="${CONFIG_PATH}/configs/${subdir}"
mkdir -p "$dir"

# Pick an unused name so creating several templates never overwrites.
name="template"
n=0
file="${dir}/${name}.nix"
while [ -e "$file" ]; do
  n=$((n + 1))
  file="${dir}/${name}-${n}.nix"
done

case "${category}:${target}:${TEMPLATE}" in

  program:home:package)
    cat >"$file" <<'MOD'
{pkgs, ...}: {
  home.packages = with pkgs; [
  ];
}
MOD
    ;;

  program:system:package)
    cat >"$file" <<'MOD'
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
  ];
}
MOD
    ;;

  program:home:module | program:system:module)
    cat >"$file" <<'MOD'
{pkgs, ...}: {
  programs."@NAME@" = {
    enable = true;
  };
}
MOD
    ;;

  service:home:module | service:system:module)
    cat >"$file" <<'MOD'
{pkgs, ...}: {
  services."@NAME@" = {
    enable = true;
  };
}
MOD
    ;;

  service:home:daemon)
    cat >"$file" <<'MOD'
{pkgs, ...}: {
  systemd.user.services."@NAME@" = {
    enable = true;
    description = "@NAME@";
    wantedBy = [ "default.target" ];
    serviceConfig = {
      # ExecStart = "${pkgs.@NAME@}/bin/@NAME@";
      Restart = "on-failure";
      RestartSec = "5";
    };
  };
}
MOD
    ;;

  service:system:daemon)
    cat >"$file" <<'MOD'
{pkgs, ...}: {
  systemd.services."@NAME@" = {
    description = "@NAME@";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      # ExecStart = "${pkgs.@NAME@}/bin/@NAME@";
      Restart = "on-failure";
      RestartSec = "5";
    };
  };
}
MOD
    ;;

  group:home:package)
    cat >"$file" <<'MOD'
{pkgs, ...}: {
  home.packages = with pkgs; [
  ];
}
MOD
    ;;

  group:system:package)
    cat >"$file" <<'MOD'
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
  ];
}
MOD
    ;;

  system:home:manual | system:system:manual)
    cat >"$file" <<'MOD'
{config, pkgs, lib, ...}: {
}
MOD
    ;;

  *)
    cat >"$file" <<'MOD'
{pkgs, ...}: {
}
MOD
    ;;
esac

cd "$dir"
codium . "$file" &