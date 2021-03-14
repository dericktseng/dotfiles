" preload calls
let g:ale_disable_lsp = 1
let g:python_host_skip_check = 1

" Plugins will be downloaded under the specified directory
call plug#begin('~/.vim/plugins')

" list of plugins managed by Vim Plug
Plug 'lervag/vimtex'
Plug 'ap/vim-css-color'
Plug 'NLKNguyen/papercolor-theme'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']} 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'

" List ends here. Plugins become visible to Vim after this call
call plug#end()

" colorscheme customlight
colorscheme PaperColor

" Coc Extension list
let g:coc_global_extensions = ['coc-clangd', 'coc-pairs', 'coc-ultisnips', 'coc-vimtex']

filetype plugin indent on
filetype plugin on
let g:python3_host_prog = '/usr/bin/python3'

" Correct RGB escape codes for vim inside tmux
if !has('nvim') && $TERM ==# 'screen-256color'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" Plugins Settings
source ~/.config/nvim/ultisnips.vim
source ~/.config/nvim/markdown-preview.vim
source ~/.config/nvim/papercolor.vim
source ~/.config/nvim/vimtex.vim
source ~/.config/nvim/ale.vim
source ~/.config/nvim/lightline.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/coc-pairs.vim

" Disables sign gutter
" set scl=no

" vi compatibility
if &compatible
  set nocompatible
endif

" because why not
set ruler

" autocompletion
set omnifunc=ale#completion#OmniFunc

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
" set relativenumber

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

" Personal Functions
" ================================================

" display group name of currently selected word
nnoremap <C-S-P> :call SyntaxGroup()<CR>

function! g:SyntaxGroup() abort
    let l:s = synID(line('.'), col('.'), 1) 
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfunction

" End Personal Functions
" ================================================

" ================================================
" Personal Shortcuts

" includes formatted opening and closed brace for programming functions.
inoremap <C-]> {<CR>}<Esc>O

" For long lines, go up or down one row rather than one line.
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

" terminal drops focus on escape
tnoremap <Esc> <C-\><C-n>

" removes highlights with <C-L>
nnoremap <C-L> :nohl<cr><C-L>

" End personal shortcuts.
" ================================================

" help menu vertical
augroup vimrc_help
  autocmd!
  autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
augroup END

" per filetype settings
autocmd BufNewFile,BufRead *.rasi setf css
autocmd BufNewFile,BufRead *.jl set ft=julia
autocmd FileType tex setlocal spell spelllang=en_us

" Spellcheck
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red

" clear conceal black box
hi clear Conceal

