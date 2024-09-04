### .zshrc
### bashow cluster
### author: bashow
### Update: 2024/09/04

# history
HISTFILE=${HOME}/.zsh_history
HISTSIZE=10000000
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

# Alt+Backspace
backward-kill-dir () {
    local WORDCHARS=${WORDCHARS/\/}
    zle backward-kill-word
}
zle -N backward-kill-dir
bindkey '^[^?' backward-kill-dir

# Alt+Left
backward-word-dir () {
    local WORDCHARS=${WORDCHARS/\/}
    zle backward-word
}
zle -N backward-word-dir
bindkey "^[[1;3D" backward-word-dir

# Alt+Right
forward-word-dir () {
    local WORDCHARS=${WORDCHARS/\/}
    zle forward-word
}
zle -N forward-word-dir
bindkey "^[[1;3C" forward-word-dir


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
alias gs='git status'
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

# screen
alias sc='screen'

# push and pop
alias pu='pushd'
alias po='popd'

# watch
alias watch="watch --color"
alias wa='watch -c -n 1 -d '

# docker
alias d="docker"
alias dc="docker-compose"

# Kubernetes
alias k="kubectl"

# tags
alias ctagsmake='ctags -e -R --extra=+fq --exclude=db --exclude=test --exclude=.git --exclude=public -f TAGS'

# relogin
alias relogin='exec $SHELL -l'
