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
(( ! $+commands[brew] )) && /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade


# Shell improvements
brew install --cask iterm2

brew install zsh-completion
if ( ! compaudit ); then
    compaudit | xargs chmod g-w
fi

brew install romkatv/powerlevel10k/powerlevel10k


# Dev tools
brew install git gnupg pinentry-mac ripgrep go jq python3 pipx

brew install colima docker kubectl k9s tilt
colima nerdctl install

brew install --cask jetbrains-toolbox
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
