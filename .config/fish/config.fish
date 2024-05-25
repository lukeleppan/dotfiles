if status is-interactive
    if not set -q ZELLIJ
        zellij attach -c optimus
    end

    set -U fish_greeting

    /opt/homebrew/bin/brew shellenv | source
    fish_add_path /usr/local/bin/
    fish_add_path $HOME/.cargo/bin/
    fish_add_path /opt/homebrew/opt/openjdk/bin
    fish_add_path $HOME/.local/share/bob/nvim-bin

    fzf --fish | source
    zoxide init fish | source
    starship init fish | source
end
