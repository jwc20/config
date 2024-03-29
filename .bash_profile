# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/cjw/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/cjw/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/cjw/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/cjw/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi


eval "$(pyenv virtualenv-init -)"

export PATH="$HOME/.pyenv/bin:$PATH"
# eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
