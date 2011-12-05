MyDotFiles
=========
Setting up my dotfile quickly

.. contents::

Feature
-------
    * Optimize for PHP coding
    * Optimize for Python coding
    * Optimize for Git branch

vim-Plugins
----------
    * `command-t`_ : fast file search, need ruby support for vim.
    * `nerdtree`_ : file browsering
    * `python-mode`_ : for python
    * `vim-pep8`_ : python pep8 check
    * `vim-pyflakes`_ : python staic check
    * `vim-pyunit`_ : python unit test
    * `vim-snipmate`_ : TextMate's snippets

        * dependencies :
            * `tlib_vim`_
            * `vim-addon-mw-utils`_
            * `snipmate-snippets`_

.. _`tlib_vim`: https://github.com/tomtom/tlib_vim
.. _`vim-snipmate`: https://github.com/garbas/vim-snipmate
.. _`vim-addon-mw-utils`: https://github.com/MarcWeber/vim-addon-mw-utils
.. _`snipmate-snippets`: https://github.com/honza/snipmate-snippets
.. _`vim-pyunit`: https://github.com/nvie/vim-pyunit
.. _`vim-pyflakes`:  https://github.com/nvie/vim-pyflakes
.. _`vim-pep8`:  https://github.com/nvie/vim-pep8
.. _`python-mode`:  https://github.com/klen/python-mode
.. _`nerdtree`:  https://github.com/scrooloose/nerdtree
.. _`command-t`: https://github.com/wincent/Command-T

Quick installation
------------------

::

    wget -O - https://github.com/jsleetw/MyDotFiles/raw/master/auto-install.sh | bash

For command-t
-------------
* check vim support

::

    vim --version | grep ruby

* if not ruby+ , install vim-nox

::
    sudo apt-get install vim-nox

* make command-t

::

    cd .vim/bundle/command-t; rake make

