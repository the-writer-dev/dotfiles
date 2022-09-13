export ZSH="/Users/joonhyeok.ahn3/.oh-my-zsh"
ZSH_THEME="sonicradish"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

export GOPATH="$HOME/go"
export PATH=$PATH:$GOPATH/bin
export FLUTTERPATH="$HOME/flutter"
export PATH=$PATH:$FLUTTERPATH/bin
alias config='/usr/bin/git --git-dir=/Users/joonhyeok.ahn3/dotfiles --work-tree=/Users/joonhyeok.ahn3'
alias vim="nvim"

export HOMEBREW_NO_AUTO_UPDATE=1
