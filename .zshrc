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

# emacs as daemon
# export ALTERNATE_EDITOR=""
# export EDITOR="emacsclient -t"
# alias emax='emacsclient -t'
# alias xmax='emacsclient -c'

#aliases
alias tmux='tmux -2'
alias dcfg='/usr/bin/git --git-dir=/home/paul/.dotfiles/ --work-tree=/home/paul'

# thefuck
eval $(thefuck --alias)

# make home and end keys work inside zsh
# bindkey "${terminfo[khome]}" beginning-of-line
# bindkey "${terminfo[kend]}" end-of-line
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line

# use zathura to open pdf files
alias -s pdf=zathura

# reload zsh config
alias reload='source ~/.zshrc'

# 10ms for key sequences
KEYTIMEOUT=1

# set 256 colors if not in tmux
# [[ $TMUX = "" ]] && export TERM="xterm-256color"

# gopass autocompletion
source <(gopass completion zsh)

# Base16 Shell
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Source antigen
source ~/.config/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# antigen bundle robbyrussell/oh-my-zsh lib/

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle robbyrussell/oh-my-zsh plugins/git
antigen bundle robbyrussell/oh-my-zsh plugins/archlinux
# antigen bundle robbyrussell/oh-my-zsh plugins/tmux
# antigen bundle robbyrussell/oh-my-zsh plugins/common-aliases # causes "remove ~/.zcompdump?"
antigen bundle zsh-users/zsh-syntax-highlighting
# antigen bundle zsh-users/zsh-autosuggestions # causes crash

# Load the theme.
antigen theme refined
# antigen theme Huvik/Cloudy
# antigen theme lambda
# antigen theme suvash
# antigen theme half-life
# antigen theme fwalch
# antigen theme wezm
# antigen theme awesomepanda
# antigen theme avit
# antigen theme halfo/lambda-mod-zsh-theme # doesn't start properly

#External themes
# antigen theme https://github.com/denysdovhan/spaceship-zsh-theme spaceship

# Tell antigen that you're done.
antigen apply

# Promptline
# source ~/.shell_prompt.sh

# Path to your oh-my-zsh installation.
# export ZSH=/home/paul/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="pure"
# ZSH_THEME="lambda-mod"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git archlinux tmux common-aliases)

# User configuration

# export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"

# export MANPATH="/usr/local/man:$MANPATH"

# source $ZSH/oh-my-zsh.sh
# alias -s pdf=zathura

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
