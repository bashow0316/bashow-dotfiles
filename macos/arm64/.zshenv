### ~/.zshenv
### bashow zsh env
# author: bashow
# Update: 2023/12/20

# PATH
export PATH=/bin:/usr/bin/:/opt/homebrew/bin:$PATH

# pyenv and pyenv-virtualenv
export PYENV_ROOT="$HOME/.pyenv"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Go
export PATH=/usr/local/go/bin:$PATH

# Cargo
. "$HOME/.cargo/env"

# Rust
source $HOME/.cargo/env

# jEnv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# llvm
export PATH="/usr/local/opt/llvm/bin:$PATH"

# icu4c
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"

# node
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

