# ============ PATH ============
eval "$(/opt/homebrew/bin/brew shellenv)"
# path for go
PATH=$HOME/go/bin:$PATH

# path for brew
PATH=/opt/homebrew/bin:$PATH

# path for cargo
PATH=$HOME/.cargo/bin:$PATH

# path for bun
PATH=$HOME/.bun/bin:$PATH

PATH=$HOME/Library/Python/3.10/bin/:$PATH

# local path
PATH=$HOME/.local/bin:$PATH
PATH=/usr/local/bin:$PATH
# ==============================

# ============ ENV =============



source <(ng completion script)
