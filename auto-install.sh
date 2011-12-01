#!/bin/bash
INSTALL_TO=~/mydev

function LinkIt() {
    if [ -e "$HOME/$1" ]; then
        echo "~/$1 already exists."
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
LinkIt .gitconfig
LinkIt .bash
LinkIt .gitconfig

echo "Installed and configured, have fun."

