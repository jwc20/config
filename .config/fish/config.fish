set -g fish_greeting

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always


alias vi='nvim'
alias lg='lazygit'
alias lzd='lazydocker'
alias ls='ls'
alias cl='clear'
alias mp='multipass'


if status is-interactive
    # Commands to run in interactive sessions can go here
end

function nvm
   bass source $HOME/.nvm/nvm.sh --no-use ';' nvm $argv
end


starship init fish | source

# fzf.fish
fzf_configure_bindings --directory=\cf --variables=\cv --git_log=\cl --git_status=\cs --history=\ch --processes=\cp
set fzf_fd_opts --hidden --exclude=.git