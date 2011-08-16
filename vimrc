call pathogen#runtime_append_all_bundles()
call pathogen#helptags() 

filetype off
filetype plugin indent on

set nocompatible
set modelines=0

colorscheme molokai
syntax enable

" tab handling
set tabstop=2
set shiftwidth=2
set softtabstop=2
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

cnoremap %% <C-R>=expand('%:h').'/'<CR>
map <leader>e :edit %%
map <leader>,  <C-^>

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap <leader>A :Ack
nnoremap <leader>ft Vatzf
nnoremap <leader>v V`]
nnoremap <leader>r :Rake<CR>
nnoremap <leader>' ysiw'
nnoremap <leader>" ysiw"

map <F2> :NERDTreeToggle<CR>
map <F3> :CommandTFlush<cr>\|:CommandT<CR>
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

"syntastic
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=1
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"changes
""let g:changes_autocmd=1
"let g:changes_hl_lines=1
let g:changes_vcs_check=1
let g:changes_vcs_system='svn'
let g:changes_verbose=0

" ack
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

"map <leader>f ggVG=
map <leader>f 1G=G
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map sa 1GVG

"comment in / out
map ac :s/^/#/<CR>
map rc :s/#//<CR>

"comment in / out
map ac :s/^/#/<CR>
map rc :s/#//<CR>

au FocusLost * :wa

" Django snippets activation by filetype
autocmd FileType python set ft=python.django "For SnipMate
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab
au BufEnter *.py set ai sw=4 ts=4 sta et fo=croql

autocmd FileType html set ft=htmldjango.html " For SnipMate
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

""set winwidth=84
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
""set winheight=10
""set winminheight=10
""set winheight=999

" for our new wkhtmltopdf templates ending in .pdf.erb we still want eruby and
" html syntax highlighting and indent rules
au BufNewFile,BufRead *.pdf.erb let b:eruby_subtype='html'|set filetype=eruby
