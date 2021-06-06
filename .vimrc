" preload calls
let g:ale_completion_enabled = 0
let g:python_host_skip_check = 1
let g:loaded_python_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0
let g:python3_host_prog = '/usr/bin/python3'

" Plugins will be downloaded under the specified directory
call plug#begin('~/.vim/plugins')

Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']} 

Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'yami-beta/asyncomplete-omni.vim'

call plug#end()

" needed for vim to display colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set t_Co=256
set background=light
colorscheme customlight

filetype plugin indent on
filetype plugin on

" Use GUI colors if possible
if (has("termguicolors"))
    set termguicolors
endif

" Plugins Settings
source ~/.config/nvim/ultisnips.vim
source ~/.config/nvim/markdown-preview.vim
source ~/.config/nvim/vimtex.vim
source ~/.config/nvim/ale.vim
source ~/.config/nvim/lightline.vim
source ~/.config/nvim/asyncomplete.vim

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

" color scheme
syntax enable

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

" completeopt
set completeopt=menuone,noinsert,preview

" help menu vertical
augroup vimrc_help
  autocmd!
  autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
augroup END

" To auto close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" per filetype settings
autocmd BufNewFile,BufRead *.rasi setf css
autocmd FileType tex setlocal spell spelllang=en_us

" clear conceal black box
hi clear Conceal
