mydotfile
=========
Setting up my dotfile quickly

Feature
-------
* Optimize for PHP coding
* Optimize for Python coding
* Optimize for Git branch

vim-Plugin
----------
* command-t : fast file search, need ruby support for vim.
* nerdtree : file browsering
* python-mode : for python
* vim-pep8 : python pep8 check
* vim-pyflakes : python staic check
* vim-pyunit : python unit test

Quick installation
------------------
    wget -O - https://github.com/jsleetw/_myDotFile/raw/master/autoinstall.sh | bash

For command-t
-------------
* check vim support
    vim --version | grep ruby
* make command-t
    cd .vim/bundle/command-t; rake make
