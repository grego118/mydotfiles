#!/usr/bin/env zsh

# Make sure Homebrew is installed
(( ! $+commands[brew] )) && /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Keep things up to date
brew update
brew upgrade

# Install and upgrade useful general utilities
brew install findutils
brew install ripgrep
brew install p7zip

# Get the latest Python versions
brew install openssl
brew install readline
brew install sqlite3
brew install xz
brew install zlib
brew install pyenv

# Install development tools
brew install git
brew install go
brew install npm
brew install cmake
brew install tmux
brew install neovim

# Setup Neovim for success
[[ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]] && curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
if [[ ! -d ~/.nvim-py2env ]]; then
    mkdir ~/.nvim-py2env
    cd ~/.nvim-py2env
    pipenv --two
    pipenv install neovim
    cd ~
fi
if [[ ! -d ~/.nvim-py3env ]]; then
    mkdir ~/.nvim-py3env
    cd ~/.nvim-py3env
    pipenv --three
    pipenv install neovim
    cd ~
fi

# Cleanup
brew cleanup
