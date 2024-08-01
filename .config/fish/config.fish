set fish_greeting ""

set -gx TERM xterm-256color
starship init fish | source
source ~/.asdf/asdf.fish

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
command -qv nvim && alias vim nvim && alias vi nvim
alias upd='sudo apt update; sudo apt upgrade -y'
alias top='htop'
alias log='tail -f storage/logs/laravel-$(date +%F).log'
alias logs='tmux \
  new-session  "tail -f storage/logs/laravel-$(date +%F).log ; read" \; \
  split-window "tail -f storage/logs/worker.log ; read" \; \
  select-layout even-vertical'
alias dev='composer dev && yarn dev'
alias build='yarn build && composer deploy'
alias queue="php artisan queue:work --queue=high,low,default --sleep=3 --tries=3"
alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'

function art --description 'Run artisan commands or rails commands'
    if test -f artisan
        php artisan $argv
    else
        rails $argv
    end
end


set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
export PATH="$PATH:/usr/local/go/bin"
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# Java
set -g __sdkman_custom_dir /home/gabriel/.sdkman

# laravel
export PATH="$PATH:$HOME/.config/composer/vendor/bin"

switch (uname)
    case Darwin
        source (dirname (status --current-filename))/config-osx.fish
    case Linux
        source (dirname (status --current-filename))/config-linux.fish
    case '*'
        source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end
