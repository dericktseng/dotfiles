-- preload calls
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider   = 0
vim.g.loaded_node_provider   = 0
vim.g.loaded_perl_provider   = 0
vim.g.python3_host_prog      = '/usr/bin/python3'

---- colorscheme and true color settings
vim.api.nvim_command('filetype plugin indent on')
vim.api.nvim_command('syntax enable')
if (vim.fn.has("termguicolors") and vim.env.TERM ~= "linux") then
    vim.o.cursorline = true
    vim.o.termguicolors = true
    vim.o.background = 'light'
    require('customlight')
else
    vim.o.background = 'dark'
end

-- load plugins before anything else
require('plugins')

-- Personal functions
require('functions')

-- LSP servers
require'lspconfig'.pyright.setup{}
require'lspconfig'.clangd.setup{}

-- Plugins Settings
vim.api.nvim_command('source ~/.config/nvim/markdown-preview.vim')
vim.api.nvim_command('source ~/.config/nvim/vimtex.vim')

-- Personal shortcuts
vim.api.nvim_command('source ~/.config/nvim/shortcuts.vim')


-- per filetype settings
vim.api.nvim_command('autocmd FileType help wincmd L')

-- REST OF VIM SETTINGS
---- tab settings
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
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
vim.o.so = 10

---- only show statusline when multiple windows open
-- vim.o.laststatus = 1

---- proper linebreaks
vim.o.wrap = true
vim.o.linebreak = true
vim.o.showbreak = "|"

---- confirmation when actions fail
vim.o.confirm = true

---- shortmessage (set shortmess += c)
vim.opt.shortmess:append('c')

---- completeopt
vim.opt.completeopt = {'menuone', 'noselect'}
