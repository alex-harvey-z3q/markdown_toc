# mdtoc.rb

Release 1.0.0.

[![Build Status](https://img.shields.io/travis/alexharv074/markdown_toc.svg)](https://travis-ci.org/alexharv074/markdown_toc)

## Overview

This script can be used to generate a Markdown Table of Contents from a Markdown source document. For more information, see my related [blog post](https://alexharv074.github.io/2018/08/28/auto-generating-markdown-tables-of-contents.html).

## Dependencies

You only require a system Ruby. Tested on Ruby versions 1.9 through to 2.7.

## Installation

Install by copying the script from the master branch:

```text
▶ curl \
  https://raw.githubusercontent.com/alexharv074/markdown_toc/master/mdtoc.rb \
  /usr/local/bin/mdtoc.rb
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
