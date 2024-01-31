#!/bin/zsh

# Export Basic Dir Variables
CONFIG_HOME=$HOME/.config
DATA_HOME=$HOME/.local/share

ZDOTDIR=$CONFIG_HOME/zsh

# Set HOME paths
CARGO_HOME=$DATA_HOME/cargo
RUSTUP_HOME=$DATA_HOME/rustup
_Z_DATA=$DATA_HOME/zoxide/z

# Add cargo env
. "$HOME/.cargo/env"

# bun completions
[ -s "/Users/lukeleppan/.bun/_bun" ] && source "/Users/lukeleppan/.bun/_bun"

NVM_DIR="$HOME/.nvm"

LC_CTYPE=en_ZA.UTF-8
LC_ALL=en_ZA.UTF-8
LANG=en_ZA.UTF-8

# preferred editor for everything
EDITOR='nvim'
