export ZSH="/Users/joonhyeok.ahn/.oh-my-zsh"
ZSH_THEME="sonicradish"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/joonhyeok.ahn/.basher/bin:/Users/joonhyeok.ahn/.emacs.d/bin:/Users/joonhyeok.ahn/.rbenv/shims:/Users/joonhyeok.ahn/.rvm/bin"
export GOROOT="/usr/local/go"
export GOPATH="$HOME/dev/go-workspace/"
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

export HOMEBREW_NO_AUTO_UPDATE=1
export DOCKER_DEFAULT_PLATFORM=linux/amd64

alias config='/usr/bin/git --git-dir=/Users/joonhyeok.ahn/dotfiles --work-tree=/Users/joonhyeok.ahn'
alias rms="rm /Users/joonhyeok.ahn/.local/share/nvim/swap/*"
alias vim="$HOME/nvim-macos/bin/nvim"

source $HOME/.zshrc_wework
