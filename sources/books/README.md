---
title: books
subtitle: Install
tags: [timechain.academy, bitcoin, lighting, development, books, python]
---

#### Install [sources/books](https://github.com/timechain-academy/timechain.academy/tree/master/sources/books) content

#### MacOS
##### Install brew
$ `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

$ `brew install make mkdocs python3`
$ `make init initialize`

#### Linux (Ubuntu/Debian/Mint/etc...)
##### Install apt-get
$ `sudo apt install apt-get`

$ `sudo apt-get install make mkdocs python3`
$ `make init initialize`

### [make](https://www.gnu.org/software/make/)
$ `make` commands

Command  | Result
------------- | -------------
$ `make books private=true`  | This downloads public books into [sources/books](.)
$ `make docs private=true`  | The mkdocs container will be built and started

