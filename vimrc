call pathogen#runtime_append_all_bundles()
call pathogen#helptags() 

filetype off
filetype plugin indent on

set nocompatible
set modelines=0

colorscheme molokai
syntax enable

" tab handling
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile

let mapleader = ","

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

" for now im am a chicken ;-)
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
"nnoremap j gj
"nnoremap k gk

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap <leader>A :Ack
nnoremap <leader>ft Vatzf
nnoremap <leader>v V`]
nnoremap <leader>e :NERDTreeToggle<CR>

map <F2> :NERDTreeToggle<CR>
map <F3> :CommandT<CR>
map <F4> <Leader>be
map <F5> :TlistToggle<CR>

"taglist settings
let Tlist_Use_Right_Window = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Auto_Open = 0

"bufexplorer
let g:bufExplorerShowRelativePath=1 
let g:bufExplorerSortBy='mru' 

map <leader>f ggVG=
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

au FocusLost * :wa

