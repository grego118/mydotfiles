#!/usr/bin/env zsh

# Make sure Xcode command line tools are installed
if (( ! $+commands[gcc] )); then
    echo "Xcode command line tools not installed... Run 'xcode-select --install' first."
    exit 1
fi

# Make sure Homebrew is installed
(( ! $+commands[brew] )) && /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Keep packages up to date
brew update
brew upgrade

# Make sure shell completions work
brew install zsh-completion
if ( ! compaudit ); then
    compaudit | xargs chmod g-w
fi

# Install and upgrade generally useful utilities
brew install findutils
brew install ripgrep
brew install p7zip

# Setup Git and custom commands
brew install git
chmod +x ~/.gitcmds/git-*

# Install Python build tools
brew install openssl
brew install readline
brew install sqlite3
brew install xz
brew install zlib
brew install pyenv

# Install latest Python versions
eval "$(pyenv init -)"
LATEST_PYTHON_2_VERSION=$(pyenv install --list | tr -d ' ' | grep '^2' | grep -v '[A-Za-z]\|-' | tail -1)
LATEST_PYTHON_3_VERSION=$(pyenv install --list | tr -d ' ' | grep '^3' | grep -v '[A-Za-z]\|-' | tail -1)
pyenv install $LATEST_PYTHON_2_VERSION
pyenv install $LATEST_PYTHON_3_VERSION

# Install development tools
brew install pipenv
brew install go
brew install npm
brew install cmake
brew install tmux
brew install neovim

# Setup Neovim for success
export PIPENV_VENV_IN_PROJECT=true
[[ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]] && curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
if [[ ! -d ~/.nvim-py2env ]]; then
    mkdir ~/.nvim-py2env
    cd ~/.nvim-py2env
    pyenv local $LATEST_PYTHON_2_VERSION
    pipenv install --python $(pyenv which python) neovim
    cd ~
fi
if [[ ! -d ~/.nvim-py3env ]]; then
    mkdir ~/.nvim-py3env
    cd ~/.nvim-py3env
    pyenv local $LATEST_PYTHON_3_VERSION
    pipenv install --python $(pyenv which python) neovim
    cd ~
fi

# Cleanup
brew cleanup
