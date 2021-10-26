ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
export ZSH="/Users/joonhyeok.ahn/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/joonhyeok.ahn/.basher/bin:/Users/joonhyeok.ahn/.emacs.d/bin:/Users/joonhyeok.ahn/.rbenv/shims"
# configs
alias config='/usr/bin/git --git-dir=/Users/joonhyeok.ahn/dotfiles --work-tree=/Users/joonhyeok.ahn'
