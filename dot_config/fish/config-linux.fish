if type -q eza
    alias ll "eza -l -g --icons=auto"
    alias lla "ll -a"
end

alias fd fdfind

fish_add_path /opt/nvim-linux-x86_64/bin

# asdf (binary installed with `go install`)
fish_add_path ~/.asdf/shims
if test -f ~/.asdf/plugins/java/set-java-home.fish
    source ~/.asdf/plugins/java/set-java-home.fish
end
