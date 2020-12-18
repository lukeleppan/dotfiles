# Luke Leppan
#
# Fish General
set fish_greeting
set EDITOR "nvim"

# ALIASES
alias g='git'
alias c='clear'
alias v='nvim'

alias pacs='sudo pacman -Sy'
alias yays='yay -Sy'

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME' 

starship init fish | source
