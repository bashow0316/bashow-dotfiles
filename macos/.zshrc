### .zshrc
### bashow macos
### author: bashow
### Update: 2021/12/30

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

### Load powerlevel10k theme
zinit ice depth"1" # git clone depth
zinit light romkatv/powerlevel10k

### Upgrade zinit and plugins
# zinit self-update
# zinit update --parallel

### Turbo and lucid
zinit ice wait    # wait is same wait"0"
zinit load zdharma-continuum/history-search-multi-word

zinit ice wait"2" # load after 2 seconds
zinit load zdharma-continuum/history-search-multi-word

zinit ice wait    # also be used in `light` and `snippet`
zinit snippet https://gist.githubusercontent.com/hightemp/5071909/raw/

zinit ice wait lucid
zinit load zdharma-continuum/history-search-multi-word

### zinit
# A glance at the new for-syntax – load all of the above
# plugins with a single command. For more information see:
# https://zdharma-continuum.github.io/zinit/wiki/For-Syntax/
zinit for \
    light-mode  zsh-users/zsh-autosuggestions \
    light-mode  zdharma-continuum/fast-syntax-highlighting \
                zdharma-continuum/history-search-multi-word \
    light-mode pick"async.zsh" src"pure.zsh" \
                sindresorhus/pure

# Binary release in archive, from GitHub-releases page.
# After automatic unpacking it provides program "fzf".
zinit ice from"gh-r" as"program"
zinit light junegunn/fzf

# One other binary release, it needs renaming from `docker-compose-Linux-x86_64`.
# This is done by ice-mod `mv'{from} -> {to}'. There are multiple packages per
# single version, for OS X, Linux and Windows – so ice-mod `bpick' is used to
# select Linux package – in this case this is actually not needed, Zinit will
# grep operating system name and architecture automatically when there's no `bpick'.
zinit ice from"gh-r" as"program" mv"docker* -> docker-compose" bpick"*linux*"
zinit load docker/compose

# Vim repository on GitHub – a typical source code that needs compilation – Zinit
# can manage it for you if you like, run `./configure` and other `make`, etc. stuff.
# Ice-mod `pick` selects a binary program to add to $PATH. You could also install the
# package under the path $ZPFX, see: https://zdharma-continuum.github.io/zinit/wiki/Compiling-programs
zinit ice as"program" atclone"rm -f src/auto/config.cache; ./configure" \
    atpull"%atclone" make pick"src/vim"
zinit light vim/vim

# Scripts that are built at install (there's single default make target, "install",
# and it constructs scripts by `cat'ing a few files). The make'' ice could also be:
# `make"install PREFIX=$ZPFX"`, if "install" wouldn't be the only, default target.
zinit ice as"program" pick"$ZPFX/bin/git-*" make"PREFIX=$ZPFX"
zinit light tj/git-extras

# Handle completions without loading any plugin, see "clist" command.
# This one is to be ran just once, in interactive session.
zinit creinstall %HOME/my_completions

# For GNU ls (the binaries can be gls, gdircolors, e.g. on OS X when installing the
# coreutils package from Homebrew; you can also use https://github.com/ogham/exa)
zinit ice atclone"dircolors -b LS_COLORS > c.zsh" atpull'%atclone' pick"c.zsh" nocompile'!'
zinit light trapd00r/LS_COLORS

# make'!...' -> run make before atclone & atpull
zinit ice as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' src"zhook.zsh"
zinit light direnv/direnv

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

# tags
alias ctagsmake='ctags -e -R --extra=+fq --exclude=db --exclude=test --exclude=.git --exclude=public -f TAGS'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


