# mdtoc.rb

Release 1.0.2.

[![Build Status](https://img.shields.io/travis/alexharv074/markdown_toc.svg)](https://travis-ci.org/alexharv074/markdown_toc)

## Overview

This script can be used to generate a Markdown Table of Contents from a Markdown source document. For more information, see my related [blog post](https://alexharv074.github.io/2018/08/28/auto-generating-markdown-tables-of-contents.html).

## Dependencies

You only require a system Ruby. Tested on Ruby versions 1.9 through to 2.7.

## Installation

Install by running this script which copies the script from the master branch (only requires Bash, tries user install if not root):

```bash
#!/bin/bash
set -x
unset INSTALL_DIR
SCRIPT_NAME="mdtoc.rb"
i_am_root() { test `id -u` -eq 0; }
check_dir_in_path() {
    IFS=: read -r -d '' -a PATH_ARRAY < <(printf '%s:\0' "$PATH")
    for p in "${PATH_ARRAY[@]}"; do
        if [[ "$p" =~ "$1{/,}" ]] && test -d "$1"; then
            return 0
        fi
    done
}
# Try to install to /opt/bin then /usr/local/bin if possible.
if i_am_root; then
    if check_dir_in_path "/opt/bin"; then
        INSTALL_DIR="/opt/bin"
    elif check_dir_in_path "/usr/local/bin"; then
        INSTALL_DIR="/usr/local/bin"
    else
        >&2 echo "Cannot install, no suitable place to put $SCRIPT_NAME!"
        exit 1
    fi
fi

# Try to install to user's homedir if possible.
LOCALBIN="$HOME/.local/bin"
if ! i_am_root; then
    if check_dir_in_path "$LOCALBIN"; then
        INSTALL_DIR="$LOCALBIN"
    else
    (>&2 echo "Cannot install locally, no $LOCALBIN!" && exit 2)
    fi
fi

INSTALL_LOCATION="$INSTALL_DIR/$SCRIPT_NAME"
URL="https://raw.githubusercontent.com/alexharv074/markdown_toc/master/mdtoc.rb"
curl --fail "$URL" -o "$INSTALL_LOCATION" && chmod +x "$INSTALL_LOCATION"

set +x
exit 0
```

## Usage

Help message:

```text
▶ mdtoc.rb -h
Usage: mdtoc.rb FILE.md [TOP [MAX]] [-h]
     FILE.md          Markdown source document
     TOP              top-level Markdown heading level (default 2)
     MAX              maximum heading level (default 4)
```

On Mac OS X, the `pbcopy` command is useful, for example:

```text
▶ mdtoc.rb README.md | pbcopy
▶ vim README.md # then paste in the ToC!
```

## More examples

[Look](./spec/tests_spec.rb#L8) [in](./spec/tests_spec.rb#L15) [the](./spec/tests_spec.rb#L22) [tests](./spec/tests_spec.rb#L29).

## License

MIT.
