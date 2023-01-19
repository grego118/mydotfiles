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
brew install git gnupg pinentry-mac ripgrep go

brew install colima docker kubectl k9s tilt
colima nerdctl install

brew install --cask google-cloud-sdk


# Python
brew install openssl readline sqlite3 xz zlib tcl-tk
brew install pyenv pyenv-virtualenv

export PYENV_ROOT="$HOME/.pyenv"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

pyenv install 2.7.18 --skip-existing

LATEST_PYTHON_3_VERSION=$(pyenv install --list | tr -d ' ' | grep '^3' | grep -v '[A-Za-z]\|-' | tail -1)
pyenv install $LATEST_PYTHON_3_VERSION --skip-existing


# Neovim
brew install neovim

pyenv virtualenv $LATEST_PYTHON_3_VERSION nvim-py3
pyenv activate nvim-py3
pip install pynvim
source deactivate

if [[ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]]; then
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    nvim -c 'PlugInstall' -c qa
else
    nvim -c 'PlugUpgrade' -c 'PlugUpdate' -c qa
fi


# Cleanup
brew cleanup