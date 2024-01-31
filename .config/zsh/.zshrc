# --------------- Zellij -----------------
if [[ -z "$ZELLIJ" ]] && [[ "$ALACRITTY" == "true" ]]; then
   zellij attach --create optimus 
fi
# ----------------------------------------

# ------------- History ----------------
alias history="history 1"
HISTFILE=$HOME/Documents/zsh_history

# Max number of entries to keep in history file.
SAVEHIST=$(( 100 * 1000 ))      # Use multiplication for readability.

# # Max number of history entries to keep in memory.
HISTSIZE=$(( 1.2 * SAVEHIST ))  # Zsh recommended value

# Use modern file-locking mechanisms, for better safety & performance.
setopt HIST_FCNTL_LOCK

# Keep only the most recent copy of each duplicate entry in history.
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY
setopt APPEND_HISTORY
# --------------------------------------------

# -------------- Plugins ---------------------
source $HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.config/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=bg=green,fg=black,bold
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=bg=red,fg=black,bold

source /Users/lukeleppan/.config/broot/launcher/bash/br

# --------------------------------------------

# -------------- Completions -----------------
setopt ALWAYS_TO_END
setopt AUTO_LIST
setopt AUTO_MENU
setopt COMPLETE_ALIASES
setopt LIST_ROWS_FIRST
setopt MENU_COMPLETE
unsetopt CASE_GLOB
unsetopt CASE_MATCH
unsetopt LIST_PACKED


fpath=($HOME/.config/zsh/completions/ $fpath)
fpath=($(brew --prefix)/share/zsh-completions $fpath)
autoload -Uz compinit && compinit

zstyle ':completion:*' menu select=1

# Grouping and Group descriptions
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%BCompletion for %d:%b'

# Make completions case insensitive
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Show hidden
zstyle ':completion:*' show-hidden true
zstyle ':completion:*' special-dirs true

zstyle ':autocomplete:*complete*:*' insert-unambiguous yes
zstyle ':autocomplete:*history*:*' insert-unambiguous yes
zstyle ':autocomplete:menu-search:*' insert-unambiguous yes
zstyle ':completion:*' menu select completer _expand _complete _ignored _correct _approximate

# ----------------- Options ------------------
# Don't let > overwrite files. To overwrite, use >| instead.
setopt NO_CLOBBER

# Allow comments to be pasted into the command line.
setopt INTERACTIVE_COMMENTS

# Don't treat non-executable files in your $path as commands.
setopt HASH_EXECUTABLES_ONLY

# Enable additional glob operators. (Globbing = pattern matching)
# https://zsh.sourceforge.io/Doc/Release/Expansion.html#Filename-Generation
setopt EXTENDED_GLOB

# Enable ** and *** as shortcuts for **/* and ***/*, respectively.
# https://zsh.sourceforge.io/Doc/Release/Expansion.html#Recursive-Globbing
setopt GLOB_STAR_SHORT

# Sort numbers numerically, not lexicographically.
setopt NUMERIC_GLOB_SORT
# --------------------------------------------

# -------------- Environment -----------------
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR=/opt/homebrew/bin/nvim
# --------------------------------------------

# -------------- Aliases ---------------------
alias docs='cd ~/Documents'
alias dl='cd ~/Downloads'
alias dev='cd ~/dev/'
alias uni="cd ~/Documents/uni"
alias reboot='sudo shutdown -r now'
alias shutdown='sudo shutdown -h now'
alias myip='curl ifconfig.me'
alias flushdns='sudo killall -HUP mDNSResponder'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gpl='git pull'
alias gco='git checkout'
alias gb='git branch'
alias mkdir='mkdir -p'
alias bup="brew update && brew upgrade && brew cleanup"
alias v="nvim"
alias l="exa -l"
alias ls="l"
alias ll="exa -l"
alias la="exa -la"
alias cat="bat"
alias python="python3.10"
alias pip="pip3.10"
function zr () { zellij run --name "$*" -- zsh -ic "$*";}
function zrf () { zellij run --name "$*" --floating -- zsh -ic "$*";}
function ze () { zellij edit "$*";}
function zef () { zellij edit --floating "$*";}
# --------------------------------------------

# zoxide
eval "$(zoxide init zsh)"

# load starship
eval "$(starship init zsh)"
