vim.loader.enable()

local opt = vim.opt
local o = vim.o
local g = vim.g
local fn = vim.fn

-- preload calls
g.loaded_python_provider = 0
g.loaded_ruby_provider = 0
g.loaded_node_provider = 0
g.loaded_perl_provider = 0
g.python3_host_prog = '/usr/bin/python3'

-- disables builtins
-- g.loaded_zip = 1
-- g.loaded_gzip = 1
-- g.loaded_matchit = 1
-- g.loaded_netrwPlugin = 1
-- g.loaded_remote_plugins = 1
-- g.loaded_shada_plugin = 1
-- g.loaded_spellfile_plugin = 1
-- g.loaded_tarPlugin = 1
-- g.loaded_2html_plugin = 1
-- g.loaded_tutor_mode_plugin = 1

-- enable termguicolors if it exists
o.termguicolors = fn.has('termguicolors') == 1

-- allow GUI and non tty to use the light theme
if (vim.env.TERM ~= 'linux') then
  o.cursorline = true
  o.background = 'light'
else
  o.background = 'dark'
end

-- load plugins (after colorscheme)
require('plugins')

-- fix for latex file detection
g.tex_flavor = 'latex'

-- REST OF VIM SETTINGS
-- tab settings
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smarttab = true
o.autoindent = true
o.smartindent = true

-- set line numbers
o.number = true
o.relativenumber = true

-- allow mouse input and clipboard
o.mouse = 'a'
o.clipboard = 'unnamedplus'

-- hides the mode description at bottom.
o.showmode = false

-- sets the cursor to have a buffer. High number to always be centered.
o.scrolloff = 9

-- tabline
o.showtabline = 2

-- confirmation when actions fail
o.confirm = true

-- shortmessage (set shortmess += cI)
opt.shortmess:append('cI')

-- completeopt
o.completeopt = 'menu,menuone,noselect'

-- automatic preview rename with :%s
opt.inccommand = 'nosplit'

-- disable folding
o.foldenable = false

-- disable wrapping
o.wrap = false

-- enable smart case
o.smartcase = true
o.ignorecase = true

-- sets the conceallevel
opt.conceallevel = 2

-- set global statusline
opt.laststatus = 3
