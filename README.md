# aspellbee
[![Build Status](https://travis-ci.org/petems/aspellbee.svg?branch=master)](https://travis-ci.org/petems/aspellbee)
[![Coverage Status](https://coveralls.io/repos/petems/aspellbee/badge.png?branch=master)](https://coveralls.io/r/petems/aspellbee)

A command line tool for running aspell

## Installation

    gem install aspellbee

## Configuration

Run the configuration utility, `aspellbee configure`.

    $ aspellbee configure
    Enter aspell locale (defaults to en_US):
    Enter aspell suggestion mode (defaults to normal):
    Enter aspell mode (defaults to html):

This will create a `.aspellbee` file in your home folder (eg. ~/.aspellbee).

aspellbee will look for a `.aspellbee` config file first in the current directory you're running it in, then will look for one in the home directory.

An example of a `.aspellbee` file:

```yaml
---
aspell_config:
  locale: en_US
  suggestion_mode: normal
  mode: html
```

## Contributing

See the [contributing guide](CONTRIBUTING.md).
