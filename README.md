# My dotfiles

It is what it is.

## One-shot setup

Copy, paste, profit:

```zsh
alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME" && \
cd ~ && \
echo '*' > .gitignore && \
mkdir .dotfiles && \
git clone --bare https://github.com/grego118/mydotfiles .dotfiles && \
rm .gitignore && \
dotfiles checkout && \
chmod +x .provision-mac.zsh && \
./.provision-mac.zsh
```

## Step-by-step setup

1. Define an alias to make things easier

    ```zsh
    alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
    ```

2. Create a temp .gitignore to avoid recursion issues when cloning

    ```zsh
    cd ~
    echo '*' > .gitignore
    ```

3. Clone the repo

    ```zsh
    mkdir .dotfiles
    git clone --bare https://github.com/grego118/mydotfiles .dotfiles
    ```

4. Remove the temporary .gitignore and checkout the files

    ```zsh
    rm .gitignore
    dotfiles checkout
    ```

5. Run the provision script

    ```zsh
    chmod +x .provision-mac.zsh
    ./.provision-mac.zsh
    ```

## Credits and thanks

- Atlassian for their [dotfile management tutorial](https://www.atlassian.com/git/tutorials/dotfiles)
- The authors of the countless VIMRC files I've cherry-picked
- This fantastic [YubiKey guide](https://github.com/drduh/YubiKey-Guide)
