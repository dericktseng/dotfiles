" preload calls
let g:loaded_python_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0
let g:python3_host_prog = '/usr/bin/python3'

" Plugins will be downloaded under the specified directory
call plug#begin('~/.vim/plugins')

Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']} 
Plug 'Raimondi/delimitMate'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

call plug#end()

" Use GUI colors if possible
if (has("termguicolors"))
    set termguicolors
endif

" color scheme
syntax enable

" needed for vim to display colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set t_Co=256
set background=light
colorscheme customlight

filetype plugin indent on
filetype plugin on

" Plugins Settings
source ~/.config/nvim/markdown-preview.vim
source ~/.config/nvim/vimtex.vim
source ~/.config/nvim/lightline.vim

" personal shortcuts
source ~/.config/nvim/shortcuts.vim

" ruler
set ruler

" autocompletion
" set omnifunc=

" show existing tab with 4 spaces width
set tabstop=4

" when indenting with '>', use 4 spaces width
set shiftwidth=4

" On pressing tab, insert 4 spaces
set expandtab
set autoindent
set smartindent

" Set Line Numbers
set number
set relativenumber

" Sets the bell off
set belloff=all

" search jumping
set incsearch

" allow mouse input
set mouse=a

" highlight search results
set hlsearch

" sets the current line highlight
set cursorline

" sets yank to keyboard
set clipboard=unnamedplus

" hides the bottom line since it is covered by lightline
set noshowmode

" sets the cursor to have a buffer. High number to always be centered.
set so=10

" only show laststatus line when multiple windows open
set laststatus=1

" Proper linebreak
set wrap linebreak nolist
set showbreak=\|

" allow confirming of actions if fail
set confirm

" shortmessage
set shortmess+=c

" completeopt
set completeopt=menuone,noselect

" help menu vertical
augroup vimrc_help
  autocmd!
  autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
augroup END

" per filetype settings
autocmd BufNewFile,BufRead *.rasi setf css
autocmd FileType tex setlocal spell spelllang=en_us

" clear conceal black box
hi clear Conceal
