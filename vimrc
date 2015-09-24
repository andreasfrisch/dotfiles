execute pathogen#infect()
hi clear
filetype plugin indent on
syntax on
colorscheme mustang
set encoding=utf-8
set nocompatible
set modelines=0
set scrolloff=3
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set showmode
set showcmd
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ruler
set relativenumber
set statusline=2
set undofile
set backspace=indent,eol,start
let mapleader = ","

"
"sane searching
"
"add vertical tab to all searches
nnoremap / /\v
inoremap / /\v
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
"apply substitutions globally on lines
set gdefault
"clear search by hitting leader and space
nnoremap <leader><space> :noh<cr>
"make tab match bracket pairs like %
nnoremap <tab> %
vnoremap <tab> %

"text wrapping
set wrap
set textwidth=79
set colorcolumn=85

"show invisible characters
set list
set listchars=tab:▸\ ,eol:¬

"remove functionality of error keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

"remap ; to : for easier commands
nnoremap ; :

"save file when vim loses focus
au FocusLost * :wa

"fold HTML tag
nnoremap <leader>ft Vatzf
"escape by jj in insert mode
inoremap jj <ESC>

"window splitting
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

map <C-n> :NERDTreeToggle<CR>
