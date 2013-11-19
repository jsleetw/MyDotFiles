#!/usr/bin/env bash

INSTALL_TO=~/mydev

if ! hash git &>/dev/null; then
    echo "git not install yet!"
    echo "You can install it by typing:"
    echo "sudo apt-get install git"
    exit
fi

function LinkIt() {
    if [[ -e "$HOME/$1" ]]; then
        echo "~/$1 already exists."
        if [[ -h "$HOME/$1" ]]; then
            echo "~/$1 is a s-link. remove then reink it"
            rm "$HOME/$1"
            ln -s "$INSTALL_TO/MyDotFiles/$1" "$HOME/$1"
        else
            echo "~/$1 is a file or directory backup it then link it"
            mv "$HOME/$1" "$HOME/$1.bak"
            ln -s "$INSTALL_TO/MyDotFiles/$1" "$HOME/$1"
        fi
    else
        ln -s "$INSTALL_TO/MyDotFiles/$1" "$HOME/$1"
    fi
}

if [ -d "$INSTALL_TO/MyDotFiles" ]; then
    echo "$INSTALL_TO/MyDotFiles already exists."
else
    cd "$INSTALL_TO"
    git clone https://jsleetw@github.com/jsleetw/MyDotFiles.git
    cd MyDotFiles

    # Download vim plugin bundles
    git submodule init
    git submodule update
fi

LinkIt .vim
LinkIt .vimrc
LinkIt .bashrc
LinkIt .bash_profile
LinkIt .gitconfig
LinkIt .bash
LinkIt .gemrc
LinkIt .git-completion.bash
LinkIt .tmux.conf
LinkIt .zshrc

echo "Installed and configured, have fun."

