#!/bin/zsh

# catch non-zsh and non-interactive shells
[[ $- == *i* && $ZSH_VERSION ]] && SHELL=/usr/bin/zsh || return 0

# set some defaults
HISTFILE=~/.zhistory
setopt BANG_HIST
setopt SHARE_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt AUTO_MENU
setopt AUTO_CD
unsetopt EXTENDED_HISTORY
unsetopt BANGHIST
export MANWIDTH=90
export HISTSIZE=10000
export SAVEHIST=10000

# path to the framework root directory
SIMPL_ZSH_DIR=$HOME/.zsh

# add ~/bin to the path if not already, the -U flag means 'unique'
typeset -U path=($HOME/bin "${path[@]:#}")

# used internally by zsh for loading themes and completions
typeset -U fpath=("$SIMPL_ZSH_DIR/"{completion,themes} $fpath)

# initialize the prompt
autoload -U promptinit && promptinit

# source shell configuration files
for f in "$SIMPL_ZSH_DIR"/{settings,plugins}/*?.zsh; do
    . "$f" 2>/dev/null
done

# uncomment these lines to disable the multi-line prompt
# add user@host, and remove the unicode line-wrap characters

# PROMPT_LNBR1=''
# PROMPT_MULTILINE=''
# PROMPT_USERFMT='%n%f@%F{red}%m'
# PROMPT_ECODE="%(?,,%F{red}%? )"

# load the prompt last
prompt simpl

# paleta st-color scheme
stcolor gruvbox-dark

# system info and AL ascii art
al-info

export VIMRC=$HOME/.vimrc
export GOPATH=$HOME/.go
export SCRIPTS=$HOME/.scripts
export PATH=$PATH:$GOPATH/bin:$HOME/.cargo/bin:$HOME/.scripts:$HOME/.local/bin
source ~/.alias
export EDITOR="vim"


# fff settings

f() {
    fff "$@"
    cd "$(\cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}

export FFF_HIDDEN=1
export FFF_FAV1=~
export FFF_FAV2=~/Downloads/
export FFF_FAV3=~/.dotfiles/scripts/.scripts/
