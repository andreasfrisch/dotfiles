set nocompatible              " required
filetype off                  " required

let data_dir = '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" VIM PLUG {{{
call plug#begin()
  Plug 'preservim/nerdtree' |
        \ Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'vim-airline/vim-airline'
  Plug 'ryanoasis/vim-devicons'
  Plug 'prabirshrestha/vim-lsp'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'
  Plug 'mattn/vim-lsp-settings'
  Plug 'github/copilot.vim'
call plug#end()
" }}}

filetype plugin indent on    " required

" asyncomplete
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 1
let g:asyncomplete_auto_signatures = 1


" Set up completion for Python using the LSP plugin
augroup asyncomplete_setup
  autocmd!
  autocmd FileType python call asyncomplete#force_refresh()
  autocmd FileType javascript,typescript,html,css call lsp#register_server({
        \ 'name': 'tsserver',
        \ 'cmd': ['typescript-language-server', '--stdio'],
        \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory('package.json', lsp#utils#get_buffer_path()))},
        \ 'allowlist': ['javascript', 'typescript', 'javascriptreact', 'typescriptreact'],
        \ })
  autocmd FileType html call lsp#register_server({
        \ 'name': 'html',
        \ 'cmd': ['vscode-html-languageserver', '--stdio'],
        \ 'allowlist': ['html'],
        \ })
  autocmd FileType css call lsp#register_server({
        \ 'name': 'css',
        \ 'cmd': ['vscode-css-languageserver', '--stdio'],
        \ 'allowlist': ['css', 'scss', 'less'],
        \ })
augroup END

hi clear
filetype plugin indent on
syntax on

set t_Co=256
" set termguicolors
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
set cursorline
set ruler
set relativenumber
set statusline=2
set undofile
set backspace=indent,eol,start
let mapleader = ","
set noerrorbells
set novisualbell
set belloff=all
set t_vb=

"
"sane searching
"
"add vertical tab to all searches
nnoremap / /\v
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
set colorcolumn=80
hi ColorColumn ctermbg=238

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"show invisible characters
set list
set listchars=tab:▸\ ,eol:¬

"remove functionality of arrow keys
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>
" nnoremap j gj
" nnoremap k gk

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

map <C-o> :NERDTreeToggle<CR>
" automatically open nerdtree when vim is launched
autocmd VimEnter * NERDTree | wincmd p
" close nerdtree if it is the last open thing
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') | q | endif

au BufRead,BufNewFile *.tsx setfiletype typescript

"autocmd VimEnter * ++nested colorscheme gruvbox | hi ExtraWhitespace ctermbg=red | match ExtraWhitespace /\s\+$/
autocmd VimEnter * hi Normal ctermbg=NONE
autocmd VimEnter * hi NonText ctermbg=NONE
autocmd VimEnter * hi SpecialKey ctermbg=NONE
"autocmd VimEnter * hi Comment ctermfg=red

