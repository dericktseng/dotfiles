-- preload calls
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider   = 0
vim.g.loaded_node_provider   = 0
vim.g.loaded_perl_provider   = 0
vim.g.python3_host_prog      = '/usr/bin/python3'

---- colorscheme and true color settings
vim.api.nvim_command('filetype plugin indent on')
vim.api.nvim_command('syntax enable')

-- allow GUI and term with termguicolors to use the light theme
if (vim.fn.has("termguicolors") and vim.env.TERM ~= "linux") then
    vim.o.cursorline = true
    vim.o.termguicolors = true
    vim.o.background = 'light'
    require('colorscheme')
elseif (vim.fn.exists(":GuiFont")) then
    vim.o.cursorline = true
    vim.o.termguicolors = true
    vim.o.background = 'light'
    require('colorscheme')
else
    vim.o.background = 'dark'
end

-- load plugins before anything else
require('plugins')

-- LSP servers
require'lspconfig'.pyright.setup{}
require'lspconfig'.clangd.setup{}

-- Personal mappings
require("mappings")

-- per filetype settings
vim.api.nvim_command('autocmd FileType help wincmd L')
vim.api.nvim_command('autocmd FileType tex setlocal spell spelllang=en_us')

-- REST OF VIM SETTINGS
---- tab settings
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = false
vim.o.smarttab = true
vim.o.autoindent = true
vim.o.smartindent = true

---- set line numbers
vim.o.number = true
vim.o.relativenumber = true

---- allow mouse input and clipboard
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'

---- hides the bottom line since it is covered by lightline
vim.o.showmode = false

---- sets the cursor to have a buffer. High number to always be centered.
vim.o.so = 9

---- latex settings
vim.o.conceallevel = 2
vim.g.tex_no_error = 1
vim.g.tex_flavor = 'latex'

---- proper linebreaks
vim.o.wrap = true
vim.o.linebreak = true
vim.o.showbreak = "|"

---- confirmation when actions fail
vim.o.confirm = true

---- shortmessage (set shortmess += cI)
vim.opt.shortmess:append('cI')

---- completeopt
vim.opt.completeopt = {'menuone', 'noselect'}
