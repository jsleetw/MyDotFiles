call pathogen#infect()
call pathogen#helptags()

let &statusline='%<[%n] %F %m%= %h%r %-19([%p%%] %3l,%02c%03V%)%y [%{FileEncoding()}] [%{ShowFileFormat()}]'

fu! FileEncoding()
    if &fileencoding == ''
        return "is not set"
    else
        return &fenc
    endif
endf

function ShowFileFormat()
    return &fileformat
endfunction 

function ForPHP()
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
endfunction

function ForPython()
    "{{{
    " Disable pylint checking every save
    let g:pymode_lint = 0
    setlocal tabstop=4
    setlocal softtabstop=4
    setlocal shiftwidth=4
    setlocal textwidth=80
    setlocal smarttab
    setlocal expandtab
    " Map ; to run PEP8 check
    "noremap ; :w!<CR>:!pep8 --show-pep8 --show-source %<CR>
    noremap <buffer> ; :call Pep8()<CR>
    " Map ' to run python stynx check
    "noremap ' :w!<CR>:!python -tt %<CR>
    noremap <buffer> ' :call Pyflakes()<CR>
    "set nonumber
    "}}}
endfunction

let Tlist_Ctags_Cmd="/usr/local/bin/exctags"
let Tlist_Inc_Winwidth = 0
nnoremap <silent> <F1> :Tlist<CR>
nnoremap <silent> <F2> :WMToggle<CR>
nnoremap <silent> <F3> :BufExplorer<CR>
filetype on
filetype plugin on
filetype indent on
:colorscheme elflord 
syntax on
set vb t_vb=
"set vb
set ru
set incsearch
set hlsearch
set ts=8
set sts=4
set sw=4
set cindent
set autoindent
set bs=2
set cinoptions=>s,e0,n0,f0,{0,}0,^0,:0,=s,ps,t0,+s,(s,m1,U1,us,)20,*30,g0
set makeprg=gmake\ OPTFLAG=-g 
:map <c-w><c-t> :WMToggle<cr>
:map <c-w><c-f> :FirstExplorerWindow<cr>
:map <c-w><c-b> :BottomExplorerWindow<cr>
set foldmethod=marker
source $VIMRUNTIME/macros/matchit.vim
":au FileType make set noexpandtab
source $VIMRUNTIME/menu.vim
set wildmenu
set cpo-=<
set wcm=<C-Z>
":map <F4> :emenu <C-Z>
set ls=2
set grepprg=global\ -t
set grepformat=%m\	%f\	%l
:set sidescroll=5
:set scrolljump=5
:set listchars+=precedes:<,extends:>
let g:vikiUseParentSuffix = 1
:map <LocalLeader>g <c-cr>
" Set standard setting for PEAR coding standards
"set tabstop=4
set shiftwidth=4
" Auto expand tabs to spaces
set expandtab
" Auto indent after a {
set autoindent
set smartindent
" Linewidth to endless
set textwidth=0
" Do not wrap lines automatically
set nowrap
" Show line numbers by default
" "set number
" Enable folding by fold markers
set foldmethod=marker 
" Autoclose folds, when moving out of them
"set foldclose=all
" Use incremental searching
set incsearch
" Jump 5 lines when running out of the screen
set scrolljump=5
" Indicate jump out of the screen when 3 lines before end of the screen
set scrolloff=3
" Repair wired terminal/vim settings
set backspace=start,eol
" Use the dictionary completion
set complete-=k complete+=k
" This function determines, wether we are on the start of the line text (then tab indents) or
" if we want to try autocompletion
function InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
" Remap the tab key to select action with InsertTabWrapper
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
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

autocmd FileType php call ForPHP()
autocmd FileType python call ForPython()
autocmd FileType make set sw=8
autocmd FileType make set sts=8
