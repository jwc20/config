[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="$PATH:/opt/yarn-1.22.10/bin"

code () {
if [[ $# = 0 ]]
then
    open -a "Visual Studio Code"
else
    [[ $1 = /* ]] && F="$1" || F="$PWD/${1#./}"
    open -a "Visual Studio Code" --args "$F"
fi
}

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"
# export "GEM_PATH=/Users/cjw/.rvm/gems/ruby-2.7.4:/Users/cjw/.rvm/gems/ruby-2.7.4@global"
# export "GEM_HOME=/Users/cjw/.rvm/gems/ruby-2.7.4"



if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export PATH="$HOME/.pyenv/bin:$PATH"
# eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
