set -g fish_greeting
set -gx TERM xterm-256color

set --export ANDROID_HOME "$HOME/Library/Android/sdk"
set --export PATH "$PATH:$ANDROID_HOME/emulator"
set --export PATH "$PATH:$ANDROID_HOME/platform-tools"

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# set -Ux PYENV_ROOT $HOME/.pyenv
# set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths

# Add pyenv to PATH and initialize it
# export PATH="$HOME/.pyenv/bin:$PATH"
# eval "$(pyenv init --path)"
# eval "$(pyenv init -)"

# set REACT_EDITOR 'code --wait'
export REACT_EDITOR='code'

# alias and commands
alias vi='nvim'
alias python='python3'
alias pip='pip3'
alias lg='lazygit'
alias lzd='lazydocker'
alias cl='clear'
alias mp='multipass'
alias dcu='docker-compose up -d --build'
alias dcd='docker-compose down'


alias claude='sudo SHELL=/bin/bash claude'


# alias python='python3'

fzf_configure_bindings --directory=\cf --variables=\cv --git_log=\cl --git_status=\cs --history=\ch --processes=\cp


function nvm
    bass source $HOME/.nvm/nvm.sh --no-use ';' nvm $argv
end

# fzf.fish
set fzf_fd_opts --hidden --exclude=.git

# # The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/cjw/Documents/google-cloud-sdk/path.fish.inc' ]; . '/Users/cjw/Documents/google-cloud-sdk/path.fish.inc'; end

# bun
set --export BUN_INSTALL "$HOME/Library/Application Support/reflex/bun"
set --export PATH $BUN_INSTALL/bin $PATH

function git_status_current_dir
    # Check if the current directory is part of a Git repository
    if git rev-parse --git-dir > /dev/null 2>&1
        # Show the git status for the current directory only
        git status -- . 
    else
        echo "Not a git repository."
    end
end

# alias brew="env PATH=(string replace (pyenv root)/shims '' \"\$PATH\") brew"


# set -Ux PYENV_ROOT $HOME/.pyenv
# fish_add_path $PYENV_ROOT/bin

# pyenv init - fish | source

# pyenv init - | source
# status --is-interactive; and source (pyenv virtualenv-init -|psub) 

eval (direnv hook fish)

starship init fish | source

set -x PATH path_to_abd $PATH

# Created by `pipx` on 2024-06-15 11:24:41
set PATH $PATH /Users/cjw/.local/bin

# Added by `rbenv init` on Sat Aug 17 13:12:00 KST 2024
status --is-interactive; and rbenv init - --no-rehash fish | source


set -gx PATH $PATH /Users/cjw/.nvm/versions/node/v22.14.0/bin
