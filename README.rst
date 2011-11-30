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
    * command-t : fast file search, need ruby support for vim.
    * nerdtree : file browsering
    * python-mode : for python
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

Quick installation
------------------

::

    wget -O - https://github.com/jsleetw/MyDotFiles/raw/master/autoinstall.sh | bash

For command-t
-------------
* check vim support

::

    vim --version | grep ruby

* make command-t

::

    cd .vim/bundle/command-t; rake make

