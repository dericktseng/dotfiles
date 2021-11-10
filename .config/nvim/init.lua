-- preload calls
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.python3_host_prog = '/usr/bin/python3'

-- colorscheme and true color settings
vim.api.nvim_command('filetype plugin indent on')

-- allow GUI and term with termguicolors to use the light theme
if (vim.fn.has("termguicolors") and vim.env.TERM ~= "linux") then
  vim.o.cursorline = true
  vim.o.termguicolors = true
  vim.o.background = 'light'
  require('colorscheme')
else
  vim.o.background = 'dark'
end

-- load plugins before anything else
require('plugins')

-- Personal mappings
require('mappings')

-- per filetype settings
vim.cmd([[
augroup vimrc
  autocmd!
  au TermOpen * startinsert
  au CmdwinEnter * call UltiSnips#LeavingBuffer()
  au CmdwinLeave * call UltiSnips#LeavingBuffer()
  au BufLeave * call UltiSnips#LeavingBuffer()
augroup END
]])

-- fix for latex file detection
vim.g.tex_flavor = 'latex'

-- REST OF VIM SETTINGS
-- tab settings
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.autoindent = true
vim.o.smartindent = true

-- set line numbers
vim.o.number = true
vim.o.relativenumber = true

-- allow mouse input and clipboard
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'

-- hides the mode description at bottom.
vim.o.showmode = false

-- sets the cursor to have a buffer. High number to always be centered.
vim.o.so = 9

-- tabline
vim.o.showtabline = 2

-- confirmation when actions fail
vim.o.confirm = true

-- shortmessage (set shortmess += cI)
vim.opt.shortmess:append('cI')

-- completeopt
vim.o.completeopt = 'menu,menuone,noselect'

vim.o.tabline = '%!v:lua.tablinestr()'
