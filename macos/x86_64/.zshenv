### ~/.zshenv
### bashow zsh env
# author: bashow
# Update: 2023/12/20

# PATH
export PATH=/bin:/usr/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/python:$PATH

# pyenv and pyenv-virtualenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Go
export PATH=/usr/local/go/bin:$PATH

# Cargo
. "$HOME/.cargo/env"

# Rust
source $HOME/.cargo/env

# llvm
export PATH="/usr/local/opt/llvm/bin:$PATH"

# icu4c
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"


