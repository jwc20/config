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

if status is-interactive
    # Commands to run in interactive sessions can go here
end

function nvm
    bass source $HOME/.nvm/nvm.sh --no-use ';' nvm $argv
end

starship init fish | source

# fzf.fish
set fzf_fd_opts --hidden --exclude=.git

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/cjw/Documents/google-cloud-sdk/path.fish.inc' ]; . '/Users/cjw/Documents/google-cloud-sdk/path.fish.inc'; end



# bun
set --export BUN_INSTALL "$HOME/Library/Application Support/reflex/bun"
set --export PATH $BUN_INSTALL/bin $PATH
