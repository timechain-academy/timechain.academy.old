---
title: books/public
subtitle: Install
tags: [timechain.academy, bitcoin, lighting, development, books, python]
---

#### Install [sources/books/public](https://github.com/timechain-academy/timechain.academy/tree/master/sources/books/public) content

### [make](https://www.gnu.org/software/make/)
$`make` commands

Command  | Result
------------- | -------------
$`make books`  | This downloads public books into [sources/books/public](.)
$`make docs`  | The mkdocs container will be built and started


#### MacOS
##### Install brew
$`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

$`brew install make mkdocs python3`
$`make init initialize`

#### Linux (Ubuntu/Debian/Mint/etc...)
##### Install apt-get
$`sudo apt install apt-get`

$`sudo apt-get install make mkdocs python3`
$`make init initialize`
