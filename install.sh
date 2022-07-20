#!/usr/bin/env bash

this_script="$(basename "$0")"
current_dir="$(basename "$(pwd)")"

if [[ "$current_dir" != "markdown_toc" ]] ; then
  echo "Run this script from the markdown_toc repo"
fi

_cp() {
  echo "cp $*"
  cp $*
}

_cp mdtoc.rb /usr/local/bin
