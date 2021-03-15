# Setup

1. Define an alias to make things easier

    ```shell
    alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
    ```

2. Create a temp .gitignore to avoid recursion issues when cloning

    ```shell
    cd ~
    echo '*' > .gitignore
    ```

3. Clone the repo

    ```shell
    mkdir .dotfiles
    git clone --bare https://github.com/grego118/mydotfiles .dotfiles
    ```

4. Remove the temporary .gitignore and checkout the files

    ```shell
    rm .gitignore
    dotfiles checkout
    ```

# Credits and thanks

- Atlassian for their [dotfile management tutorial](https://www.atlassian.com/git/tutorials/dotfiles)
- The authors of the countless .vimrc files I've cherry-picked
