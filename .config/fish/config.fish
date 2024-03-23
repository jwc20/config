set -g fish_greeting
set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths


# alias and commands
alias vi='nvim'
alias lg='lazygit'
alias lzd='lazydocker'
alias cl='clear'
alias mp='multipass'
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

alias brew="env PATH=(string replace (pyenv root)/shims '' \"\$PATH\") brew"


# set -Ux PYENV_ROOT $HOME/.pyenv
# fish_add_path $PYENV_ROOT/bin

pyenv init - | source
status --is-interactive; and source (pyenv virtualenv-init -|psub) 

starship init fish | source
