### .zshrc
### bashow macos
### author: bashow
### Update: 2020/07/12


### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p $HOME/.zinit
    command git clone https://github.com/zdharma/zinit $HOME/.zinit/bin && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f" || \
        print -P "%F{160}▓▒░ The clone has failed.%f"
fi
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit installer's chunk

### Calling compinit With Turbo Mode
# Load using the for-syntax
# zinit wait lucid for \
#     "some/plugin"
#  zinit wait lucid for \
#     "other/plugin"

zinit wait lucid atload"zicompinit; zicdreplay" blockf for \
    zsh-users/zsh-completions

# powerlevel 10k
zinit ice depth=1; zplugin light romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

### zsh

# LANG
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# emacs like
bindkey -e

# colors
autoload -U colors
colors

# history
HISTFILE=${HOME}/.zsh_history
HISTSIZE=100000
SAVEHIST=10000000
setopt extended_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
# setopt share_history
setopt bang_hist

# no_tify
setopt no_tify

# no beep
setopt no_beep
setopt nolistbeep

# transient rprompt
setopt transient_rprompt

# auto cd cd pushed
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt autoremoveslash
setopt magic_equal_subst

# correct
setopt correct

# auto list list types auto menu
setopt auto_list
setopt list_types
setopt auto_menu

# glob
setopt extended_glob

# resume
setopt auto_resume

# short_loop
setopt short_loops

### zinit

# Two regular plugins loaded without tracking.
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting

# Plugin history-search-multi-word loaded with tracking.
zinit load zdharma/history-search-multi-word

# Binary release in archive, from GitHub-releases page.
# After automatic unpacking it provides program "fzf".
zinit ice from"gh-r" as"program"
zinit load junegunn/fzf-bin

# OMZ plugins
zplugin snippet OMZ::plugins/docker-machine/docker-machine.plugin.zsh
zplugin snippet OMZ::plugins/docker-compose/docker-compose.plugin.zsh


### alias

# ls grep df
alias l='ls'
alias ls='ls -G'
alias ll='ls -AFhla'
alias la='ls -la'
alias grep='grep --color'
alias df='df -h'

# cd
alias .='cd .'
alias ..='cd ..'

# emacs
alias e='emacsnw'
alias emacsw='emacs &'
alias emacsnw='emacs -nw'
alias em='emacsnw'

# tmux
alias t='tmux'
alias tn='tmux new-session -s'
alias ta='tmux a -t'
alias tl='tmux ls'

# git
alias g='git'
alias ga='git add'
alias gaa='git add -A'
alias gc='git commit -am'
alias gco='git checkout'
alias gpull='git pull'
alias gpush='git push'
alias gb='git branch'
alias gd='git diff'
alias gf='git fetch'
alias gm='git merge'
alias gcl='git config --list'

# git alias bashow
alias gcm='git checkout master'
alias gcb='git checkout bashow'
alias gmm='git merge master'
alias gmb='git merge bashow'

# history
alias h='history'

# ps
alias p='ps'

# mkdir rmdir
alias md='mkdir'

# tail
alias l='less -N'
alias tf='tail -f'

# find
alias fd='find . -type d -name'
alias ff='find . -type f -name'

# latexmk
alias latexmkpvc='latexmk -pvc'

# icu4c
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"

# openssl
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

# sqlite
export PATH="/usr/local/opt/sqlite/bin:$PATH"
