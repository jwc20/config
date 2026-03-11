set -g fish_greeting
set -gx TERM xterm-256color

set --export ANDROID_HOME "$HOME/Library/Android/sdk"
set --export PATH "$PATH:$ANDROID_HOME/emulator"
set --export PATH "$PATH:$ANDROID_HOME/platform-tools"

set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

export REACT_EDITOR='code'

alias vi='nvim'
alias lg='lazygit'
alias lzd='lazydocker'
alias lzn='lazynpm'
alias cl='clear'
alias mp='multipass'
alias dcu='docker-compose up -d --build'
alias dcd='docker-compose down'
alias claude='sudo SHELL=/bin/bash claude'
alias brew="env PATH=(string replace (pyenv root)/shims '' \"\$PATH\") brew"
alias sw='~/go/bin/stopwatch-tui'
alias stopwatch='~/go/bin/stopwatch-tui'
alias strudel='open Strudel\ REPL-darwin-arm64/Strudel\ REPL.app'
alias sn='~/go/bin/sniffa'

fzf_configure_bindings --directory=\cf --variables=\cv --git_log=\cl --git_status=\cs --history=\ch --processes=\cp

set fzf_fd_opts --hidden --exclude=.git

set --export BUN_INSTALL "$HOME/Library/Application Support/reflex/bun"
set --export PATH $BUN_INSTALL/bin $PATH

set PATH $PATH /Users/cjw/.local/bin
set -gx PATH $PATH /Users/cjw/.nvm/versions/node/v22.14.0/bin

function nvm
    bass source $HOME/.nvm/nvm.sh --no-use ';' nvm $argv
end

function git_status_current_dir
    if git rev-parse --git-dir >/dev/null 2>&1
        git status -- .
    else
        echo "Not a git repository."
    end
end

pyenv init - fish | source

status --is-interactive; and rbenv init - --no-rehash fish | source
starship init fish | source

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/cjw/Downloads/google-cloud-sdk/path.fish.inc' ]
    . '/Users/cjw/Downloads/google-cloud-sdk/path.fish.inc'
end

# OpenClaw Completion
source "/Users/cjw/.openclaw/completions/openclaw.fish"
