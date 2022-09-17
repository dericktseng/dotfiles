local fn = require "functions"
local keymap = vim.keymap.set
local wrap = fn.fnwrap

-- Leader keys
keymap('n', "<SPACE>", "<NOP>")
vim.g.mapleader = " "
vim.g.maplocalleader = ";"

-- quick spelling fixes
keymap('i', '<C-X>', [[<c-g>u<Esc>[s1z=`]a<c-g>u]])
keymap('n', '<C-X>', [[mz[s1z=`z]])

-- gx fix
keymap('n', 'gx', [[:execute 'silent! !xdg-open ' . shellescape(expand('<cWORD>'), 1)<CR>]])

-- updating
keymap('n', '<Leader>p', ':PackerSync<CR>')
keymap('n', '<Leader>R', [[:so %<CR>:echo 'reloaded file'<CR>]], {silent=false})

-- keymaps
keymap('t', '<ESC>', [[<C-\><C-N>]])

keymap('n', '<C-L>', [[:nohl<CR><C-L>]])
keymap('n', 'k', fn.nav_up, {expr=true})
keymap('n', 'j', fn.nav_down, {expr=true})
keymap('x', 'k', fn.nav_up, {expr=true})
keymap('x', 'j', fn.nav_down, {expr=true})
keymap('n', 'dd', fn.smart_dd, {expr=true})
keymap('n', '<C-D>', '<C-D>zz')
keymap('n', '<C-U>', '<C-U>zz')
keymap('n', '<C-J>', ':cnext<CR>')
keymap('n', '<C-K>', ':cprev<CR>')
keymap('n', '<C-T>', [[:tabnew<CR>:Ex<CR>]])
keymap('n', '<LocalLeader>j', ':lnext<CR>')
keymap('n', '<LocalLeader>k', ':lprev<CR>')
keymap('n', 'Y', 'y$')
keymap('n', 'E', '$')
keymap('n', 'B', '^')
keymap('n', 'n', 'nzzzv')
keymap('n', 'N', 'Nzzzv')
keymap('n', 'J', 'mzJ`z')
keymap('n', 'W', ':w!<CR>')
keymap('n', '.', ';')
keymap('x', '.', ';')

keymap('i', ',', ',<c-g>u')
keymap('i', '.', '.<c-g>u')
keymap('i', '!', '!<c-g>u')
keymap('i', '?', '?<c-g>u')
keymap('i', ';', ';<c-g>u')
keymap('i', '/', '/<c-g>u')
keymap('i', '=', '=<c-g>u')

keymap('x', 'H', [[<gv]])
keymap('x', 'K', [[:m '<-2<CR>gv=gv]])
keymap('x', 'J', [[:m '>+1<CR>gv=gv]])
keymap('x', 'L', [[>gv]])
keymap('x', 'E', '$')
keymap('x', 'B', '^')

keymap('x', 'p', '"_dP')
keymap('x', 'P', 'p')

keymap('n', '<C-G>', [[:silent exec '!gimp ' . expand('<cfile>') . ' &'<CR>]])
keymap('n', '<C-H>', [[:silent exec '!inkscape ' . expand('<cfile>') . ' &'<CR>]])

-- add surrounding brackets, quotes, etc
keymap('x', '"', [[<esc>`>a"<esc>`<i"<esc>%]])
keymap('x', "'", [[<esc>`>a'<esc>`<i'<esc>%]])
keymap('x', '(', [[<esc>`>a)<esc>`<i(<esc>%]])
keymap('x', '[', [[<esc>`>a]<esc>`<i[<esc>%]])
keymap('x', '{', [[<esc>`>a}<esc>`<i{<esc>%]])
keymap('x', '|', [[<esc>`>a|<esc>`<i|<esc>%]])

-- vim easy align
keymap('x', 'ga', '<Plug>(EasyAlign)')
keymap('n', 'ga', '<Plug>(EasyAlign)')

-- Splitting
keymap('n', '<Leader>-', '<C-W>s')
keymap('n', '<Leader>\\', '<C-W>v')
keymap('n', '<Leader>h', '<C-W>h')
keymap('n', '<Leader>j', '<C-W>j')
keymap('n', '<Leader>k', '<C-W>k')
keymap('n', '<Leader>l', '<C-W>l')
keymap('n', '<Leader>o', ':only<CR>')
keymap('n', '<Leader>H', '<C-W>H')
keymap('n', '<Leader>J', '<C-W>J')
keymap('n', '<Leader>K', '<C-W>K')
keymap('n', '<Leader>L', '<C-W>L')
keymap('n', 'gf', '<C-W>gf')

-- Tabs
keymap('n', '<Leader>1', '1gt')
keymap('n', '<Leader>2', '2gt')
keymap('n', '<Leader>3', '3gt')
keymap('n', '<Leader>4', '4gt')
keymap('n', '<Leader>5', '5gt')
keymap('n', '<Leader>6', '6gt')
keymap('n', '<Leader>7', '7gt')
keymap('n', '<Leader>8', '8gt')
keymap('n', '<Leader>9', '9gt')
keymap('n', '<Leader>0', ':tablast<CR>')

-- Telescope
keymap('n', '<Leader>fg', fn.project_files)
keymap('n', '<Leader>v', fn.vimrc)
keymap('n', '<Leader>ff', wrap(require("telescope.builtin").find_files, {no_ignore=true}))
keymap('n', '<Leader>fp', wrap(require("telescope.builtin").man_pages, {sections={"ALL"}}))
keymap('n', '<Leader>fd', require("telescope").extensions.file_browser.file_browser)
keymap('n', '<Leader>fb', ':Telescope buffers<CR>')
keymap('n', '<Leader>fh', ':Telescope help_tags<CR>')
keymap('n', '<Leader>fl', ':Telescope heading<CR>')
keymap('n', '<Leader>fr', ':Telescope live_grep<CR>')
keymap('n', '<Leader>fz', ':Telescope current_buffer_fuzzy_find<CR>')
keymap('n', '<Leader>ft', ':Telescope treesitter<CR>')
keymap('n', '<Leader>fm', ':Telescope marks<CR>')
keymap('n', '<Leader>fc', ':Telescope commands<CR>')
keymap('n', '<Leader>fq', ':Telescope quickfix<CR>')
keymap('n', '<LocalLeader>fq', ':Telescope loclist<CR>')

-- LSP Configurations
keymap('n', ']d', vim.diagnostic.goto_next)
keymap('n', '[d', vim.diagnostic.goto_prev)
keymap('n', '<Localleader>d', fn.local_diagnostics)
keymap('n', '<Leader>d', ':Telescope diagnostics<CR>')
keymap('n', '<Leader>ed', ':Telescope lsp_definitions<CR>')
keymap('n', '<Leader>et', ':Telescope lsp_type_definitions<CR>')
keymap('n', '<Leader>ei', ':Telescope lsp_implementations<CR>')
keymap('n', '<Leader>es', ':Telescope lsp_document_symbols<CR>')
keymap('n', '<Leader>ews', ':Telescope lsp_workspace_symbols<CR>')
keymap('n', '<Leader>er', ':Telescope lsp_references<CR>')

keymap('n', '<Leader>ea', vim.lsp.buf.code_action)
keymap('n', '<Leader>eh', vim.lsp.buf.hover)
keymap('n', '<Leader>eci', vim.lsp.buf.incoming_calls)
keymap('n', '<Leader>eco', vim.lsp.buf.outgoing_calls)
keymap('n', '<Leader>ewl', vim.lsp.buf.list_workspace_folders)
keymap('n', '<Leader>ewa', vim.lsp.buf.add_workspace_folder)
keymap('n', '<Leader>ewr', vim.lsp.buf.remove_workspace_folder)
keymap('n', '<Leader>ef', vim.lsp.buf.formatting)
keymap('n', '<Leader>eg', vim.lsp.buf.signature_help)
keymap('n', '<Leader>ee', vim.lsp.buf.rename, {silent=false})

-- Fugitive Configurations
keymap('n', '<Leader>gs', ':Git<CR>')
keymap('n', '<Leader>gp', ':Git push<CR>')
keymap('n', '<Leader>gf', ':Git fetch<CR>')
keymap('n', '<Leader>gd', ':Gvdiffsplit!<CR>')
keymap('n', '<Leader>gh', ':diffget //2<CR>')
keymap('n', '<Leader>gl', ':diffget //3<CR>')
