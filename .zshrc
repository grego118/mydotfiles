export VISUAL=/usr/local/bin/nvim
export EDITOR=/usr/local/bin/nvim

export PIPENV_VENV_IN_PROJECT=true


if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi


alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
