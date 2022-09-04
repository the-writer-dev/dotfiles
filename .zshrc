export ZSH="/Users/joonhyeok.ahn/.oh-my-zsh"
ZSH_THEME="sonicradish"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

export PATH="/Users/joonhyeok.ahn/go/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/joonhyeok.ahn/.basher/bin:/Users/joonhyeok.ahn/.emacs.d/bin:/Users/joonhyeok.ahn/.rbenv/shims:/Users/joonhyeok.ahn/.rvm/bin"

alias config='/usr/bin/git --git-dir=/Users/joonhyeok.ahn/dotfiles --work-tree=/Users/joonhyeok.ahn'
alias vim="nvim"

source $HOME/.zshrc_wework
