" essentials {{{
set nocompatible						"use vim settings instead of vi
set modelines=0							"prevents some security exploits having to do with modelines in files
" }}}

"vundle plugins {{{
"set the runtime path to include Vundle and initialize
filetype off     " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

"		PLUGIN LIST
Plugin 'gmarik/Vundle.vim'						" let Vundle manage Vundle, required
Plugin 'scrooloose/nerdtree'					" display directory tree
Plugin 'vim-airline/vim-airline'				" display buffers on screen like tabs
Plugin 'kien/ctrlp.vim'							" find files in project folder
Plugin 'justinmk/vim-gtfo'						" terminal-got,folder-gof
Plugin 'danro/rename.vim'						" rename file using :rename
Plugin 'terryma/vim-multiple-cursors'			" multiple cursors
"Plugin 'sirver/ultisnips'						" code snippets
"Plugin 'lrvick/Conque-Shell'					" open terminal or bash app in a buffer
Plugin 'while1eq1/vim-monokai-black'			" black monokai instead of grey
Plugin 'godlygeek/tabular'						" aligns text
"Plugin 'powerline/powerline'
Plugin 'scrooloose/nerdcommenter'				" commenter
Plugin 'mhinz/vim-startify'						" fancy start screen
Plugin 'Valloric/YouCompleteMe'         " auto complete
Plugin 'mru.vim'                        " most recently used
Plugin 'ntpeters/vim-better-whitespace' " Remove trailing spaces
Plugin 'mhartington/oceanic-next'
Plugin 'arcticicestudio/nord-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'valloric/youcompleteme'
"Plugin 'vim-ctrlspace/vim-ctrlspace'
"Plugin 'jalvesaq/nvim-r'
"Plugin 'chrisbra/vim-autosave'					" auto save feature
call vundle#end()            " required
filetype plugin indent on    " required
"}}}

" interface {{{

set columns=100				" set linewrap column
set nowrap

set expandtab				" set tab to 4 spaces
set tabstop=4
"set smartindent
set noet ci pi sts=0 sw=4 ts=4		"for auto indentation
set guifont=Inconsolata-regular\11	"set default font
set showmatch				"when your cursor moves over a parenthesis-like character, the matching one will be highlighted as well
" set colorscheme based on time
"if strftime("%H")<11
"	colorscheme monokai
"elseif strftime("%H")<18
"	colorscheme summerfruit256
"else
"	colorscheme monokai
"endif
" set colorscheme based on GUI or CLI
if has('gui_running')
	colorscheme molokai
else
	colorscheme monokai
	colorscheme OceanicNext
endif
set number					"show line numbers
set guioptions-=T guioptions-=m guioptions-=r	"hide toolbar,menubar,right scroll
set hidden					"hide inactive buffers

" }}}

" foldings {{{

set nofoldenable				" fold by default
" map za(open fold) to <space>
nnoremap <F7> za
set foldmethod=indent			" fold by indent
:setlocal foldmethod=marker		" set fold method of .vimrc to marker
set foldnestmax=1				" fold only top level

" }}}

" features {{{

" Enable Mouse
set mouse=a
" Dictionary path, from which the words are being looked up
set dictionary=/usr/share/dict/words
:set sessionoptions=buffers		"save buffer sessions with :mksession
let g:netrw_liststyle=3			"set default netrw style
set splitright					"":vs will split window vertically
set wildmenu					"graphical menu of folder contents when :e <tab> is pressed
set incsearch					"search as characters are entered
set hlsearch					"in search, highlight matches
set autochdir					" change working dir to present dir
let @/=""						" remove highlight
set clipboard=unnamedplus		" uses clipboard for yank
"set shortmess+=c
set noswapfile
"highlight cursor line in insert mode
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul
" }}}

" Plugin Settings {{{
"display buffers as tabs : airline plugin
let g:airline_theme='oceanicnext'
let g:one_allow_italics = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 0
"let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '>'
let g:ctrlp_working_path_mode = 'c'		"ctrlp settings
let g:airline#extensions#wordcount#enabled = 1
"ultisnip
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"YCM
let g:ycm_autoclose_preview_window_after_completion=1
" White space
highlight ExtraWhitespace ctermbg=none
let strip_whitespace_on_save = 1
let MRU_Max_Entries = 30
filetype plugin on
" Tabularize just with the first occurance of '=' using 1=
"AddTabularPattern 1=/^[^=]*\zs=
" enable autosave on vim startup
"let g:auto_save = 1
"let g:auto_save_no_updatetime = 1  " do not change the 'updatetime' option
"let g:auto_save_in_insert_mode = 0  " do not save while in insert mode
" }}}

" custom shortcuts {{{
"if exists('$TMUX')
"	let Left = OD
"	let Right = OC
"endif
let mapleader = "\<Space>"			"set <Space> as leader key
" set ; instead of :
nnoremap ; :
vmap ; :
nmap <silent> <leader>/ :nohlsearch<CR>
nnoremap <C-d> :t.<CR> 			"set C-d as duplicate line
nnoremap <S-Down> :m .+1<CR> 			"set <S-down> as move line down
vnoremap <S-Down> :'<,'>m +2<CR> 			"set <S-down> as move line down
nnoremap <S-Up> :m .-2<CR> 			"set <S-Up> as move line up
nnoremap j J
nnoremap <Leader>s :w<CR> 			"set leader-s as save file
nnoremap <Leader>p "+p <CR> 			" map paste from system clipboard to <leader>p
nnoremap <C-Left> :bp <CR> 			" navigate buffers using <leader> left,right
nnoremap <C-Right> :bn <CR>
"navigate windows using <leader> wsad
nnoremap <S-w> <C-W>k <CR>
nnoremap <S-s> <C-W>j <CR>
nnoremap <S-a> <C-W>h <CR>
nnoremap <S-d> <C-W>l <CR>
"nnoremap <M-s> <CR>
nnoremap <F2> :NERDTreeToggle <CR> 			" map nerd tree toggle to <F2>
nnoremap <F5> :so $MYVIMRC <CR> 			" map refresh .vimrc to <F5>
map <Leader>q <Plug>NERDCommenterToggle('n', 'Toggle') <CR> 			" map comment, uncomment
map <silent> <F11> :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen") <CR> 			" map <F11> to full screen
nnoremap cp :let @+=expand('%:p:h') <CR> 			" map cp to copy file path to system clipboard
" win key mapped to esc using keysym Super_L = Escape in ~/.Xmodmap
for i in range(1,9) 			" map <leader>i to buffer i
	execute 'nmap <Leader>'.i.' <Plug>AirlineSelectTab'.i.'<CR>'
endfor
nnoremap + <C-a> 			"map ctrl-a : increment number : to alt-a
nnoremap <C-a> :%y+ <CR> 			" map ctrl-a to select all in normal mode
nnoremap <Leader>v :vs <CR> 			" map vertical and horizontal split to <leader> h,v
nnoremap <Leader>h :sv <CR>
nnoremap <M-q> :q <CR>
nnoremap - <C-x>
nnoremap <C-x> :bw <CR>
nnoremap <Leader>c :e ~/.vimrc <CR> 			" shortcut to open vimrc file
nnoremap <Leader>r :e /home/mili/Dropbox/ref.txt <CR>	" shortcut to open ref file
" shortcut to open notes file
nnoremap <Leader>n :e /home/mili/Dropbox/Comp/comp_notes.txt<CR>:set foldmethod=marker<CR>:set foldenable<CR>
nnoremap <m-r> :MRU <CR>
let c='a'			" Allow the usage of Alt key in terminal
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw
set timeout ttimeoutlen=50
" remap ijkl to arrows
"map i <Up>
"map j <Left>
"map k <Down>
"nnoremap h i
" }}}

" custom commands {{{
command! -nargs=1 Restore execute "source ~/.vim/sessions/"+<q-args>
" }}}

" Abbreviations {{{
:ab py_mod import numpy as np<CR>import matplotlib.pyplot as plt
:ab py_os import os<CR>from glob import glob
:ab py_mat from scipy.io import loadmat,savemat
:ab py_im import numpy as np
:ab py_nlp import re<CR>import spacy<CR>nlp = spacy.load('en')
" }}}

" Notes {{{
" 1. Swapped Esc and Capslock keys using Gnome tweak tool
" }}}




