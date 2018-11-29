" essentials
" {{{
set nocompatible						"use vim settings instead of vi
set modelines=0							"prevents some security exploits having to do with modelines in files
" }}}



"vundle plugins
"{{{
                                            " set the runtime path to include Vundle and initialize
filetype off                                " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()                         " alternatively, pass a path where Vundle should install plugins
                                            " call vundle#begin('~/some/path/here')

" PLUGIN LIST
Plugin 'gmarik/Vundle.vim'                  " let Vundle manage Vundle, required
Plugin 'scrooloose/nerdtree'                " display directory tree
Plugin 'vim-airline/vim-airline'            " display buffers on screen like tabs
Plugin 'kien/ctrlp.vim'                     " find files in project folder
Plugin 'justinmk/vim-gtfo'                  " terminal-got,folder-gof
Plugin 'danro/rename.vim'                   " rename file using :rename
Plugin 'terryma/vim-multiple-cursors'       " multiple cursors
Plugin 'while1eq1/vim-monokai-black'        " black monokai instead of grey
Plugin 'godlygeek/tabular'                  " aligns text
Plugin 'scrooloose/nerdcommenter'           " commenter
Plugin 'mhinz/vim-startify'                 " fancy start screen
Plugin 'Valloric/YouCompleteMe'             " auto complete
Plugin 'mru.vim'                            " most recently used
Plugin 'ntpeters/vim-better-whitespace'     " Remove trailing spaces
Plugin 'mhartington/oceanic-next'
Plugin 'arcticicestudio/nord-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'valloric/youcompleteme'
Plugin 'suan/vim-instant-markdown'
call vundle#end()                           " required
filetype plugin indent on                   " required
"}}}



" interface
" {{{

set nowrap
set colorcolumn=73,80

set expandtab                                 " set tab to 4 spaces
set tabstop=4
set noet ci pi sts=0 sw=4 ts=4                " for auto indentation
set guifont=Inconsolata-regular\11            " set default font
set showmatch                                 " when your cursor moves over a parenthesis-like character, the matching one will be highlighted as well
if has('gui_running')
	colorscheme molokai
else
	colorscheme monokai
	colorscheme OceanicNext
endif
set number                                    " show line numbers
set guioptions-=T guioptions-=m guioptions-=r " hide toolbar,menubar,right scroll
set hidden                                    " hide inactive buffers

" }}}



" foldings
" {{{
set nofoldenable				" fold by default
nnoremap <F7> za
set foldmethod=indent			" fold by indent
:setlocal foldmethod=marker		" set fold method of .vimrc to marker
set foldnestmax=1				" fold only top level
" }}}



" features
" {{{
set mouse=a                          " Enable Mouse
set dictionary=/usr/share/dict/words " Dictionary path, from which the words are being looked up
:set sessionoptions=buffers          " save buffer sessions with :mksession
let g:netrw_liststyle=3              " set default netrw style
set splitright                       "                                                            " :vs will split window vertically
set wildmenu                         " graphical menu of folder contents when :e <tab> is pressed
set incsearch                        " search as characters are entered
set hlsearch                         " in search, highlight matches
set autochdir                        " change working dir to present dir
let @/=                              """ remove highlight
set clipboard=unnamedplus            " uses clipboard for yank
set noswapfile                       " set shortmess+=c
autocmd InsertEnter * set cul        " highlight cursor line in insert mode
autocmd InsertLeave * set nocul
" }}}



" Plugin Settings
" {{{
" display buffers as tabs : airline plugin
let g:airline_theme='oceanicnext'
let g:one_allow_italics = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:ctrlp_working_path_mode = 'c'						" ctrlp settings
let g:airline#extensions#wordcount#enabled = 1
" ultisnip
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" YCM
let g:ycm_autoclose_preview_window_after_completion=1
" White space
highlight ExtraWhitespace ctermbg=none
let strip_whitespace_on_save = 1
let MRU_Max_Entries = 30
filetype plugin on
" }}}



" custom shortcuts
" {{{

" set <Space> as leader key
let mapleader = "\<Space>"
nmap <silent> <leader>/ :nohlsearch<CR>

" map paste from system clipboard to <leader>p
nnoremap <Leader>p "+p <CR>

" set Redo to r
nnoremap r <C-r>

"navigate windows using <leader> wsad
nnoremap <S-w> <C-W>k <CR>
nnoremap <S-s> <C-W>j <CR>
nnoremap <S-a> <C-W>h <CR>
nnoremap <S-d> <C-W>l <CR>

" set Leader-d as duplicate line
nnoremap <C-d> :t.<CR>
vnoremap <C-d> :'<,'>t.<CR>

" set <S-down>, <S-up> as move line down/up
nnoremap <S-Down> :m +1<CR>
nnoremap <S-Up> :m .-2<CR>

" join line
nnoremap j J

" replace tabs with spaces
nnoremap <Leader>t :%s/\t/    /g<CR>

" set leader-s as save file
nnoremap <Leader>s :update<CR>
inoremap <C-q> <Esc>:update<CR>gi

" navigate buffers using <leader>left, right
nnoremap <C-Left> :bp <CR>
nnoremap <C-Right> :bn <CR>

" map nerd tree toggle to <Leader>-m
nnoremap <Leader>m :NERDTreeToggle <CR>

" map refresh .vimrc to <F5>
nnoremap <F5> :so $MYVIMRC <CR>

" map comment, uncomment
map <C-_> :call NERDComment(0, "toggle")<CR>
"map <C-//> <Plug>NERDCommenterToggle('n', 'Toggle')

" map <F11> to full screen
map <silent> <F11> :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen") <CR>

" map cp to copy file path to system clipboard
nnoremap cp :let @+=expand('%:p:h') <CR>

" win key mapped to esc using keysym Super_L = Escape in ~/.Xmodmap
for i in range(1,9) 			" map <leader>i to buffer i
	execute 'nmap <Leader>'.i.' <Plug>AirlineSelectTab'.i.'<CR>'
endfor

" map increment, decrement numbers
nnoremap + <C-a>
nnoremap - <C-x>

" map ctrl-a to select all in normal mode
nnoremap <C-a> :%y+ <CR>

" map vertical and horizontal split to <leader> h,v
nnoremap <Leader>v :vs <CR>
nnoremap <Leader>h :sv <CR>
nnoremap <C-x> :bw <CR>

" shortcuts to open vimrc, ref, notes files
nnoremap <Leader>c :e ~/.vimrc <CR>
nnoremap <Leader>r :e /home/mili/Dropbox/zim/ref.txt <CR>
nnoremap <Leader>n :e /home/mili/Dropbox/Comp/comp_notes.txt<CR>:set foldmethod=marker<CR>:set foldenable<CR>

" shortcut for most recently used files
"nnoremap <m-r> :MRU <CR>

" Allow the usage of Alt key in terminal
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw
set timeout ttimeoutlen=50
" }}}



" custom commands
" {{{
command! -nargs=1 Restore execute "source ~/.vim/sessions/"+<q-args>
" }}}



" Abbreviations
" {{{
:ab py_nlp import re<CR>import spacy<CR>nlp = spacy.load('en')
:ab py_pass raise NotImplementedError()
:ab py_getset def get_bhro(self):<CR>return self._bhro<CR><CR>def set_bhro(self, bhro: Any):<CR>self._bhro = bhro
:ab py_mili print('------mili------')<CR>print('------ENDmili--------')
" }}}



" Notes
" {{{
" }}}

