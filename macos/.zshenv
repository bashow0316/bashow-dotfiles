### ~/.zshenv
### bashow zsh env
# author: bashow
# Update: 2021/06/07

# PATH
export PATH=/bin:/usr/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/python:$PATH
export ZSHHISH=$HOME/work/zsh_hist/

# pyenv and pyenv-virtualenv
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"

# Go
export PATH=/usr/local/go/bin:$PATH

# Rust
# source $HOME/.cargo/env


# llvm
export PATH="/usr/local/opt/llvm/bin:$PATH"

# icu4c
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"

# openssl
# export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

# sqlite
export PATH="/usr/local/opt/sqlite/bin:$PATH"

# vscode
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"


. "$HOME/.cargo/env"
