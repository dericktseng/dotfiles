" preload calls
let g:loaded_python_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0
let g:python3_host_prog = '/usr/bin/python3'
filetype plugin indent on

lua << EOF

-- load plugins before anything else
require('plugins')

-- Plugin local configs
require('compeconfig')
require('functions')

-- LSP servers
require'lspconfig'.pyright.setup{}
require'lspconfig'.clangd.setup{}

EOF

syntax enable

" Only true color settings here.
if (has("termguicolors") && $TERM !=# "linux")
    set t_Co=256
    set cursorline
    set termguicolors
    set background=light
    colorscheme customlight
else
    set background=dark
endif

" Plugins Settings
source ~/.config/nvim/markdown-preview.vim
source ~/.config/nvim/vimtex.vim
source ~/.config/nvim/lightline.vim

" personal shortcuts
source ~/.config/nvim/shortcuts.vim

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

" allow mouse input
set mouse=a

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

" per filetype settings
autocmd FileType help wincmd L
autocmd FileType tex setlocal spell spelllang=en_us
autocmd BufWritePost plugins.lua PackerCompile
