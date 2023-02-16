# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


export VISUAL="$(brew --prefix)/bin/nvim"
export EDITOR="$(brew --prefix)/bin/nvim"
export PIPX_DEFAULT_PYTHON="$(brew --prefix)/bin/python3"
export GPG_TTY="$(tty)"


path+=("$HOME/dev/flutter/bin")
path+=("$(go env GOPATH)/bin")


source "$(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme"
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
source <(kubectl completion zsh)
source <(colima completion zsh)


if type brew &>/dev/null; then
    FPATH="$(brew --prefix)/share/zsh-completions:$FPATH"

    autoload -Uz compinit
    compinit
fi


alias ll="ls -lah"

alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias updatedb="sudo /usr/libexec/locate.updatedb"

alias g="git"
alias k="kubectl"
alias n="nerdctl --namespace k8s.io"


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
