#!/usr/bin/env bash

set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
script_name="mdtoc.rb"
source_file="$script_dir/$script_name"

die() {
  printf 'install.sh: %s\n' "$*" >&2
  exit 1
}

path_contains_dir() {
  local needle="$1"
  local entry

  IFS=':' read -r -a path_entries <<< "$PATH"
  for entry in "${path_entries[@]}"; do
    [[ "$entry" == "$needle" ]] && return 0
  done

  return 1
}

select_install_dir() {
  local dir

  if [[ -n "${INSTALL_DIR:-}" ]]; then
    printf '%s\n' "$INSTALL_DIR"
    return 0
  fi

  if [[ "${EUID:-$(id -u)}" -eq 0 ]]; then
    for dir in /opt/bin /usr/local/bin; do
      if [[ -d "$dir" ]] && path_contains_dir "$dir"; then
        printf '%s\n' "$dir"
        return 0
      fi
    done

    die 'could not find /opt/bin or /usr/local/bin in PATH; set INSTALL_DIR to choose a destination'
  fi

  printf '%s\n' "$HOME/.local/bin"
}

[[ -f "$source_file" ]] || die "could not find $source_file"

install_dir="$(select_install_dir)"
mkdir -p "$install_dir"

if [[ ! -w "$install_dir" ]]; then
  die "$install_dir is not writable; rerun as a user with write access or set INSTALL_DIR"
fi

install_path="$install_dir/$script_name"
cp "$source_file" "$install_path"
chmod 0755 "$install_path"

printf 'Installed %s\n' "$install_path"

if ! path_contains_dir "$install_dir"; then
  printf 'Note: %s is not in PATH; add it to run %s by name.\n' "$install_dir" "$script_name" >&2
fi
