let g:flake8_ignore = "E501,W293"
call pathogen#infect()
call pathogen#helptags()

" This must be first, because it changes other options as side effect
set nocompatible
let mapleader="," " change the mapleader from \ to ,
" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
set hidden
set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set nobackup             " no more .swp
set noswapfile
" Auto expand tabs to spaces
set expandtab

"highlight whitespaces for python
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

set pastetoggle=<leader>p  " p to paste mode

"nnoremap ; :

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

nnoremap j gj
nnoremap k gk

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <silent> ,/ :nohlsearch<CR>

" sudo
cmap w!! w !sudo tee % >/dev/null

filetype plugin indent on

if has('autocmd')
    autocmd FileType php call ForPHP()
    autocmd FileType python call ForPython()
    autocmd FileType make set sw=8
    autocmd FileType make set sts=8
    autocmd filetype html,xml set listchars-=tab:>.
endif

set laststatus=2
let &statusline='%<[%n] %{HasPaste()}%F %m%= %h%r %-19([%p%%] %3l,%02c%03V%)%y [%{FileEncoding()}] [%{&fileformat}]'

syntax on

if !exists("no_plugin_maps") && !exists("no_toggle_mouse_maps")
    if !hasmapto('<SID>ToggleMouse()')
        noremap <leader>m :call <SID>ToggleMouse()<CR>
        inoremap <leader>m <Esc>:call <SID>ToggleMouse()<CR>a
    endif
endif

"set hotkey for NERDTree
noremap <leader>n :NERDTreeToggle<CR>

function! s:ToggleMouse()
    if !exists("s:old_mouse")
        let s:old_mouse = "a"
    endif

    if &mouse == ""
        let &mouse = s:old_mouse
        echo "Mouse is for Vim (" . &mouse . ")"
    else
        let s:old_mouse = &mouse
        let &mouse=""
        echo "Mouse is for terminal"
    endif
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction

fu! FileEncoding()
    if &fileencoding == ''
        return "is not set"
    else
        return &fenc
    endif
endf

fu! ForPHP()
    " {{{
    " Map ; to run PHP parser check
    noremap ; :w!<CR>:!php -l %<CR>
    " The completion dictionary is provided by Rasmus:
    " http://lerdorf.com/funclist.txt
    set dictionary-=~/.vim/other/phpfunclist.txt dictionary+=~/.vim/other/phpfunclist.txt 
    " Correct indentation after opening a phpdocblock and automatic * on every
    " line
    set formatoptions=qroct
    " file
    map! =fil /**<CR><LEFT>* @file <CR>* @brief <CR>* @author <CR>* $Author:  $<CR>* @version  $<CR>* $Revision:  $<CR>* @date <CR>* @bug <CR>* @todo <CR>* @warning <CR>*/
    " require, require_once
    map! =req /**<CR><LEFT>*  <CR>*  <CR>*  <CR>* @since  <CR>*/<CR><LEFT>require '';<ESC>hi
    map! =roq /**<CR><LEFT>*  <CR>*  <CR>*  <CR>* @since  <CR>*/<CR><LEFT>require_once '';<ESC>hi
    " include, include_once
    map! =inc /**<CR><LEFT>*  <CR>*  <CR>*  <CR>* @since  <CR>*/<CR><LEFT>include '';<ESC>hi
    map! =ioc /**<CR><LEFT>*  <CR>*  <CR>*  <CR>* @since  <CR>*/<CR><LEFT>include_once '';<ESC>hi
    " define
    map! =def /**<CR><LEFT>*  <CR>*  <CR>*  <CR>* @since  <CR>* @access public<CR>*/<CR><LEFT>define ('', '');<ESC>?',<CR>i
    " class
    map! =cla /**<CR><LEFT>*  <CR>*  <CR>*  <CR>* @since  <CR>*/<CR><LEFT>class  {<CR><CR>}<CR><ESC>?/\*\*<CR>/ \* <CR>$i
    " public/private methods
    map! =puf /**<CR><LEFT>*  <CR>*  <CR>*  <CR>* @since  <CR>* @access public<CR>* @param  <CR>* @return void<CR>*/<CR><LEFT>public function  ()<CR>{<CR><CR>}<CR><ESC>?/\*\*<CR>/ \* <CR>$i
    map! =prf /**<CR><LEFT>*  <CR>*  <CR>*  <CR>* @since  <CR>* @access private<CR>* @param  <CR>* @return void<CR>*/<CR><LEFT>private function _ ()<CR>{<CR><CR>}<CR><ESC>?/\*\*<CR>/ \* <CR>$i
    " public/private attributes
    map! =pua /**<CR><LEFT>*  <CR>*  <CR>* @var <CR>* @since  <CR>*/<CR><LEFT>public $ = ;<ESC>?/\*\*<CR>/ \* <CR>$i
    map! =pra /**<CR><LEFT>*  <CR>*  <CR>* @var <CR>* @since  <CR>*/<CR><LEFT>private $_ = ;<ESC>?/\*\*<CR>/ \* <CR>$i
    " for loop
    map! =for for ($i = 0; $i ; $i++) {<CR><CR>}<Up><Up><ESC>/ ;<CR>i
    " foreach loop
    map! =foe foreach ($ as $ => $) {<CR><CR>}<Up>
    " while loop
    map! =whi while ( ) {<CR><CR>}<Up><Up><ESC>/ )<CR>i
    " switch statement
    map! =swi switch ($) {<CR>case '':<CR><CR>break;<CR>default:<CR><CR>break;<CR>}<Up><Up><Up><Up><Up><Up><Up><ESC>/)<CR>i
    " alternative
    map! =if if () {<CR><CR>} else {<CR><CR>}<Up><Up><Up><Up><Up><Up><ESC>/)<CR>i
    " }}} With close char mapping de-activated (currently in-active)
endf

fu! ForPython()
    "{{{
    " Disable pylint checking every save
    "let g:pymode_lint = 0
    setlocal softtabstop=4
    setlocal shiftwidth=4
    setlocal textwidth=80
    setlocal smarttab
    setlocal expandtab
    "let g:flake8_ignore = "--ignore=E501" " pass E501 line too long (82 characters) error
    "let g:flake8_ignore = "E501,W293" move to top
    " Map ; to run PEP8 check
    "noremap ; :w!<CR>:!pep8 --show-pep8 --show-source %<CR>
    noremap <buffer> <leader>; :call Flake8()<CR>
    " Map ' to run python stynx check
    "noremap ' :w!<CR>:!python -tt %<CR>
    "noremap <buffer> <leader>' :call Pyflakes()<CR>
    "noremap <buffer> <leader>l :PyLintToggle<CR>
    let no_pyunit_maps = 1
    noremap <leader>c :call PyUnitRunTests()<CR>
    noremap! <leader>c <Esc>:call PyUnitRunTests()<CR>
    let g:PyUnitTestsStructure = "side-by-side"
    let g:pymode_rope_always_show_complete_menu = 1
    "}}}
endf


" Linewidth to endless
set textwidth=0
" Enable folding by fold markers
set foldmethod=marker 
" Autoclose folds, when moving out of them
"set foldclose=all
" Jump 5 lines when running out of the screen
set scrolljump=5
" Indicate jump out of the screen when 3 lines before end of the screen
set scrolloff=3
" Use the dictionary completion
set complete-=k complete+=k

" Use SuperTab with snipmate now
"let g:snips_trigger_key='<tab>'
" This function determines, wether we are on the start of the line text (then tab indents) or
" if we want to try autocompletion
"fu! InsertTabWrapper()
"    let col = col('.') - 1
"    if !col || getline('.')[col - 1] !~ '\k'
"        return "\<tab>"
"    else
"        return "\<c-p>"
"    endif
"endf
"" Remap the tab key to select action with InsertTabWrapper
"inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" CTRL-Tab is Next window
noremap <C-Tab> :tabn<CR>
inoremap <C-Tab> <C-O>:tabn<CR>
cnoremap <C-Tab> <C-C>:tabn<CR>
" CTRL-F4 is Close window
noremap <C-F4> :tabc
inoremap <C-F4> <C-O>:tabc
cnoremap <C-F4> <C-C>:tabc
" CTRL+N is new tab
noremap <C-N> :tabe<CR>
inoremap <C-N> <C-O>:tabe<CR>
cnoremap <C-N> <C-C>:tabe<CR>
" CTRL+[ is previous tab
map <C-]> :tabp<CR>
" CTRL+} is next tab
map <C-\> :tabn<CR>
" CTRL+d is close tab
noremap <C-D> :tabc<CR>

set fileencodings=ucs-bom,utf-8,big5,cp936,gb18030,euc-jp,euc-kr,latin1
set encoding=utf-8
set termencoding=utf-8
set fileformats=unix,dos,mac
set fileformat=unix

set t_Co=256
let python_highlight_all = 1
colorscheme koehler

autocmd BufNewFile,BufRead *.json set ft=javascript "use javascript support json
set runtimepath^=~/.vim/bundle/ctrlp.vim
