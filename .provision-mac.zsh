#!/usr/bin/env zsh

set -o errexit
set -o nounset
set -o pipefail
if [[ "${TRACE-0}" == "1" ]]; then
    set -o xtrace
fi


# System updates
sudo softwareupdate --install --all --agree-to-license
sudo xcodebuild -license accept
xcodebuild -runFirstLaunch


# Homebrew
(( ! $+commands[brew] )) && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update
brew upgrade


# General stuff
defaults write -g ApplePressAndHoldEnabled -bool false

brew install powerlevel10k
if ( ! compaudit ); then
    compaudit | xargs chmod g-w
fi

brew install zsh-completion fzf

brew tap zackelia/formulae
brew install bclm
sudo bclm write 80

brew install --cask iterm2


# Dev tools
brew install git go python3 pipx cmake

brew install jq

brew install gnupg pinentry-mac

brew install docker colima kubectl k9s tilt helm
colima nerdctl install

brew install --cask google-cloud-sdk


# Neovim
brew install neovim

if [[ -d ~/.nvim ]]; then
    rm -rf ~/.nvim-env/venv
else
    mkdir ~/.nvim-env
fi

python3 -m venv ~/.nvim-env/venv
~/.nvim-env/venv/bin/pip install pynvim

if [[ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]]; then
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    nvim -c 'PlugInstall' -c qa
else
    nvim -c 'PlugUpgrade' -c 'PlugUpdate' -c qa
fi


# Cleanup
brew cleanup
