### .zshrc
### bashow macos
### author: bashow
### Update: 2024/02/04

# zinit

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### zinit home
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

### Load powerlevel10k theme
zi ice depth"1" # git clone depth
zi light romkatv/powerlevel10k

### zsh completions

#### compinit
autoload -Uz compinit
compinit

#### brew
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

#### kubectl
source <(kubectl completion zsh)

#### az
autoload bashcompinit && bashcompinit
source $(brew --prefix)/etc/bash_completion.d/az

#### compinit
autoload -Uz compinit
compinit

### Upgrade zinit and plugins
# zi self-update
# zi update --parallel

### Turbo and lucid
zi ice wait lucid
zi load zdharma-continuum/history-search-multi-word
zi ice wait lucid
zi load zdharma-continuum/fast-syntax-highlighting
zi ice wait lucid
zi snippet https://gist.githubusercontent.com/hightemp/5071909/raw/


# Binary release in archive, from GitHub-releases page.
# After automatic unpacking it provides program "fzf".
zi ice from"gh-r" as"program"
zi light junegunn/fzf

# One other binary release, it needs renaming from `docker-compose-Linux-x86_64`.
# This is done by ice-mod `mv'{from} -> {to}'. There are multiple packages per
# single version, for OS X, Linux and Windows – so ice-mod `bpick' is used to
# select Linux package – in this case this is actually not needed, Zinit will
# grep operating system name and architecture automatically when there's no `bpick'.
zi ice from"gh-r" as"program" mv"docker* -> docker-compose" bpick"*linux*"
zi load docker/compose

# Vim repository on GitHub – a typical source code that needs compilation – Zinit
# can manage it for you if you like, run `./configure` and other `make`, etc.
# Ice-mod `pick` selects a binary program to add to $PATH. You could also install the
# package under the path $ZPFX, see: https://zdharma-continuum.github.io/zinit/wiki/Compiling-programs
zi ice \
  as"program" \
  atclone"rm -f src/auto/config.cache; ./configure" \
  atpull"%atclone" \
  make \
  pick"src/vim"
zi light vim/vim

# Scripts built at install (there's single default make target, "install",
# and it constructs scripts by `cat'ing a few files). The make'' ice could also be:
# `make"install PREFIX=$ZPFX"`, if "install" wouldn't be the only default target.
zi ice as"program" pick"$ZPFX/bin/git-*" make"PREFIX=$ZPFX"
zi light tj/git-extras

# For GNU ls (the binaries can be gls, gdircolors, e.g. on OS X when installing the
# coreutils package from Homebrew; you can also use https://github.com/ogham/exa)
zi ice atclone"dircolors -b LS_COLORS > c.zsh" atpull'%atclone' pick"c.zsh" nocompile'!'
zi light trapd00r/LS_COLORS

# make'!...' -> run make before atclone & atpull
zi ice as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' src"zhook.zsh"
zi light direnv/direnv

## Plugin

# Syntax
zi ice wait lucid
zi light zsh-users/zsh-syntax-highlighting

# autosuggestions
zi ice wait lucid
zi light zsh-users/zsh-autosuggestions

# auto completions
zi ice wait lucid
zi light zsh-users/zsh-completions

# git
zi ice wait lucid
zi snippet OMZL::git.zsh
zi snippet OMZP::git

# docker
zi ice wait lucid
zi snippet OMZP::docker
zi ice wait lucid
zi snippet OMZP::docker-compose

# ansible
zi ice wait lucid
zi snippet OMZP::ansible

# vagrant
zi ice wait lucid
zi snippet OMZP::vagrant

# cargo
zi ice lucid nocompile
zi load MenkeTechnologies/zsh-cargo-completion

# golang
zi ice wait lucid
zi snippet OMZP::golang

# brew
zi ice wait lucid
zi snippet OMZP::brew

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk


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

# latexmk
alias latexmkpvc='latexmk -pvc'

# tags
alias ctagsmake='ctags -e -R --extra=+fq --exclude=db --exclude=test --exclude=.git --exclude=public -f TAGS'

# relogin
alias relogin='exec $SHELL -l'


