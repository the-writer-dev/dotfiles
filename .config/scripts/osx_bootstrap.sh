
#!/bin/bash
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

# inspired by
# https://gist.github.com/codeinthehole/26b37efa67041e1307db
# https://github.com/why-jay/osx-init/blob/master/install.sh

SUDO_USER=$(whoami)

if test ! $(which brew); then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

brew upgrade
PROD=$(softwareupdate -l | grep "\*.*Command Line" | head -n 1 | awk -F"*" '{print $2}' | sed -e 's/^ *//' | tr -d '\n') || true
if [[ ! -z "$PROD" ]]; then
  softwareupdate -i "$PROD" --verbose
fi

PACKAGES=(
    git
    go
    gopls
    postgresql
    redis
    rabbitmq
    ripgrep
    vim
    zsh
    docker
	docker-compose
)

echo "Installing Packages..."
for package in "${PACKAGES[@]}"; do
    echo "Installing $package"
    brew list $package || brew install $package
done

CASKS=(
	flutter
    dozer
	alfred
    visual-studio-code
    vlc
    slack
    zoom
    copyclip
    postman
    minikube
    kubernetes-cli	
    virtualbox
)

echo "Installing Cask Apps..."
for cask in "${CASKS[@]}"; do
    echo "Installing $cask"
    if [[ "$cask" == "emacs" ]]; then
	if [[ ! -d "Applications/$cask.app" ]]; then
	    brew install --cask $cask --no-quarantine
	fi
    else
	if [[ ! -d "Applications/$cask.app" ]]; then
	    brew install --cask $cask
	fi     
    fi	
done 

ZSH_SYNTAX_HIGHLIGHT=~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
if [[ ! -d "$ZSH_SYNTAX_HIGHLIGHT" ]]; then 
   git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi
ZSH_AUTO_SUGGESTIONS=~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
if [[ ! -d "$ZSH_AUTO_SUGGESTIONS" ]]; then
   git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

brew cleanup
brew update
brew upgrade
brew doctor

echo "OSX bootstrapping completed"
