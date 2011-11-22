#!/bin/bash
INSTALL_TO=~/mydev

function LinkIt() {
    if [ -e "$HOME/$1" ]; then
        echo "~/$1 already exists."
    else
        ln -s "$INSTALL_TO/_myDotFile/$1" "$HOME/$1"
    fi
}

if [ -d "$INSTALL_TO/_myDotFile" ]; then
    echo "$INSTALL_TO/_myDotFile already exists."
else
    cd "$INSTALL_TO"
    git clone git://github.com/jsleetw/_myDotFile.git
    cd _myDotFile

    # Download vim plugin bundles
    git submodule init
    git submodule update
fi

LinkIt .vim
LinkIt .vimrc
LinkIt .bashrc
LinkIt .gitconfig

echo "Installed and configured, have fun."

