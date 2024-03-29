# zsh settings

# zsh edge theme
# source ~/.vim/plugged/edge/zsh/.zsh-theme-edge-dark

# Source antigen
source ~/.config/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# antigen bundle robbyrussell/oh-my-zsh lib/

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle mafredri/zsh-async
antigen bundle git
antigen bundle archlinux
# antigen bundle tmux
antigen bundle common-aliases
antigen bundle zsh-users/zsh-syntax-highlighting
# antigen bundle zsh-users/zsh-autosuggestions

# Load the theme.
antigen theme halfo/lambda-mod-zsh-theme

# Tell antigen that you're done.
antigen apply

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

# PATH configuration
# add binary folders to path variable
path+=$HOME/.config/emacs/bin
path+=$HOME/.cargo/bin
export PATH

# aliases
alias emacs='emacs -nw'
alias ls='exa'
alias tmux='tmux -2'
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# thefuck
eval $(thefuck --alias)

# make home and end keys work inside zsh
# bindkey "${terminfo[khome]}" beginning-of-line
# bindkey "${terminfo[kend]}" end-of-line
# bindkey "\e[1~" beginning-of-line
# bindkey "\e[4~" end-of-line

# use zathura to open pdf files (but doesn't work)
# alias -s pdf=zathura

# 10ms for key sequences
KEYTIMEOUT=1

# set 256 colors if not in tmux
# [[ $TMUX = "" ]] && export TERM="xterm-256color"

