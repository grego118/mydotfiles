export VISUAL=/usr/local/bin/nvim
export EDITOR=/usr/local/bin/nvim

export PIPENV_VENV_IN_PROJECT=true


path+=~/.gitcmds
path+=~/dev/flutter/bin


source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"


if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi


alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
