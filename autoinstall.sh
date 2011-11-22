#!/bin/sh
INSTALL_TO=~/mydev

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

[ -e "$INSTALL_TO/_myDotFile" ] && die "$INSTALL_TO/_myDotFile already exists."
[ -e "~/.vim" ] && die "~/.vim already exists."
[ -e "~/.vimrc" ] && die "~/.vimrc already exists."
[ -e "~/.bashrc" ] && die "~/.bashrc already exists."
[ -e "~/.gitconfig" ] && die "~/.gitconfig already exists."

cd "$INSTALL_TO"
git clone git://github.com/jsleetw/_myDotFile.git
cd _myDotFile

# Download vim plugin bundles
git submodule init
git submodule update

# Symlink ~/.vim and ~/.vimrc
cd ~
ln -s "$INSTALL_TO/_myDotFile/.vimrc" .vimrc
ln -s "$INSTALL_TO/_myDotFile/.vim" .vim
ln -s "$INSTALL_TO/_myDotFile/.bashrc" .bashrc
ln -s "$INSTALL_TO/_myDotFile/.gitconfig" .gitconfig

echo "Installed and configured , have fun."

