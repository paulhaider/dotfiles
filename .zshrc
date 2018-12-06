# zsh settings

# vim as default editor in the terminal
if [[ -d $HOME/.config/nvim ]]
then
	export VISUAL=nvim
	export EDITOR=nvim
	alias vi='nvim'
else
	export VISUAL=vim
	export EDITOR=vim
	alias vi='vim'
fi

# but still use emacs mode for ZLE (Zsh Line Editor)
bindkey -e

# set variables for FeynArts, FeynCalc and LoopTools
export LT=$HOME/Software/LoopTools/x86_64-Linux

# emacs as daemon
# export ALTERNATE_EDITOR=""
# export EDITOR="emacsclient -t"
# alias emax='emacsclient -t'
# alias xmax='emacsclient -c'

#aliases
alias tmux='tmux -2'
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
# alias vis='TERM=xterm-256color && vis && TERM=rxvt-unicode'

# configure using GNU compilers
alias gconfwrap='FC=gfortran CC=gcc CXX=g++ ./configure --generic'

# thefuck
# eval $(thefuck --alias)

# make home and end keys work inside zsh
# bindkey "${terminfo[khome]}" beginning-of-line
# bindkey "${terminfo[kend]}" end-of-line
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line

# use zathura to open pdf files
alias -s pdf=zathura

# 10ms for key sequences
KEYTIMEOUT=1

# set 256 colors if not in tmux
# [[ $TMUX = "" ]] && export TERM="xterm-256color"

# gopass autocompletion
# source <(gopass completion zsh)

# Base16 Shell
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Source antigen
source ~/.config/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# antigen bundle robbyrussell/oh-my-zsh lib/

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle archlinux
# antigen bundle tmux
antigen bundle common-aliases
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

# Load the theme.
# antigen theme refined
# antigen theme Huvik/Cloudy
# antigen theme lambda
# antigen theme suvash
# antigen theme half-life
# antigen theme fwalch
# antigen theme wezm
# antigen theme awesomepanda
# antigen theme avit
antigen theme halfo/lambda-mod-zsh-theme

#External themes
# antigen theme https://github.com/denysdovhan/spaceship-zsh-theme spaceship

# Tell antigen that you're done.
antigen apply

# Promptline
# source ~/.shell_prompt.sh
