### ~/.zshenv
### bashow zsh env
# author: bashow
# Update: 2021/06/07


# PATH
export PATH=/usr/local/sbin:/usr/local/bin:/usr/local/share/python:$PATH
export ZSHHISH=$HOME/work/zsh_hist/
export PATH=/usr/local/go/bin:$PATH

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

source $HOME/.cargo/env

