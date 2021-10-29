fn = require "functions"
local vimg = vim.g
local keymap = fn.keymap

-- UltiSnips Settings
vimg.UltiSnipsExpandTrigger = "<TAB>"
vimg.UltiSnipsJumpForwardTrigger = "<TAB>"
vimg.UltiSnipsJumpBackwardTrigger = "<S-TAB>"

-- Leader keys
keymap('n', "<SPACE>", "<NOP>")
vimg.mapleader = " "
vimg.maplocalleader = ";"

-- quick spelling fixes
keymap('i', '<C-B>', [[<c-g>u<Esc>[s1z=`]a<c-g>u]])
keymap('n', '<C-B>', [[mz[s1z=`z]])

-- gx quickfix
keymap('n', 'gx', [[:execute 'silent! !xdg-open ' . shellescape(expand('<cWORD>'), 1)<CR>]])

-- updating
keymap('n', '<Leader>p', ':PackerSync<CR>')
keymap('n', '<Leader>R', [[:luafile %<CR>:echo 'reloaded file'<CR>]], {silent=false})

-- keymaps
keymap('t', '<ESC>', [[<C-\><C-N>]])

keymap('n', '<C-L>', [[:nohl<CR><C-L>]])
keymap('n', 'k', [[v:lua.smart_nav('k')]], {expr=true})
keymap('n', 'j', [[v:lua.smart_nav('j')]], {expr=true})
keymap('v', 'k', [[v:lua.smart_nav('k')]], {expr=true})
keymap('v', 'j', [[v:lua.smart_nav('j')]], {expr=true})
keymap('n', '<C-J>', ':cnext<CR>')
keymap('n', '<C-K>', ':cprev<CR>')
keymap('n', '<C-Q>', [[:lua fn.togglelist('c')<CR>]])
keymap('n', '<C-T>', [[:tabnew<CR>:Ex<CR>]])
keymap('n', '<LocalLeader>j', ':lnext<CR>')
keymap('n', '<LocalLeader>k', ':lprev<CR>')
keymap('n', '<LocalLeader>q', [[:lua fn.togglelist('l')<CR>]])
keymap('n', 'Y', 'y$')
keymap('n', 'n', 'nzzzv')
keymap('n', 'N', 'Nzzzv')
keymap('n', 'J', 'mzJ`z')
keymap('n', 'W', ':w<CR>')
keymap('n', '.', ';')
keymap('v', '.', ';')
keymap('n', '<Right>', '>>')
keymap('n', '<Left>', '<<')
keymap('n', '<Up>', ':m .-2<CR>==')
keymap('n', '<Down>', ':m .+1<CR>==')

keymap('i', ',', ',<c-g>u')
keymap('i', '.', '.<c-g>u')
keymap('i', '!', '!<c-g>u')
keymap('i', '?', '?<c-g>u')
keymap('i', ';', ';<c-g>u')
keymap('i', '/', '/<c-g>u')
keymap('i', '=', '=<c-g>u')

keymap('v', 'H', [[<gv]])
keymap('v', 'K', [[:m '<-2<CR>gv=gv]])
keymap('v', 'J', [[:m '>+1<CR>gv=gv]])
keymap('v', 'L', [[>gv]])

keymap('n', '<C-G>', [[:silent exec '!gimp ' . expand('<cfile>') . ' &'<CR>]])
keymap('n', '<C-H>', [[:silent exec '!inkscape ' . expand('<cfile>') . ' &'<CR>]])

-- add surrounding brackets, quotes, etc
keymap('v', '"', [[<esc>`<i"<esc>`>la"<esc>]])
keymap('v', "'", [[<esc>`<i'<esc>`>la'<esc>]])
keymap('v', '(', [[<esc>`<i(<esc>`>la)<esc>]])
keymap('v', '[', [[<esc>`<i[<esc>`>la]<esc>]])
keymap('v', '{', [[<esc>`<i{<esc>`>la}<esc>]])
keymap('v', '|', [[<esc>`<i|<esc>`>la|<esc>]])

-- vim easy align
vim.cmd([[
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
]])

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
keymap('n', '<Leader>t', ':tabnew<CR>:term<CR>')

-- Telescope
keymap('n', '<Leader>ff', ':Telescope find_files<CR>')
keymap('n', '<Leader>fb', ':Telescope buffers<CR>')
keymap('n', '<Leader>fh', ':Telescope help_tags<CR>')
keymap('n', '<Leader>fl', ':Telescope heading<CR>')
keymap('n', '<Leader>fg', ':lua fn.project_files()<CR>')
keymap('n', '<Leader>fb', ':lua fn.project_files()<CR>')
keymap('n', '<Leader>vrc', ':lua fn.vimrc()<CR>')
keymap('n', '<Leader>r', ':Telescope live_grep<CR>')

-- LSP Configurations
keymap('n', ']d', ':lua vim.lsp.diagnostic.goto_next()<CR>')
keymap('n', '[d', ':lua vim.lsp.diagnostic.goto_prev()<CR>')
keymap('n', '<Leader>ed', ':lua vim.lsp.buf.definition()<CR>')
keymap('n', '<Leader>eD', ':lua vim.lsp.buf.declaration()<CR>')
keymap('n', '<Leader>es', ':lua vim.lsp.buf.document_symbol()<CR>')
keymap('n', '<Leader>eh', ':lua vim.lsp.buf.hover()<CR>')
keymap('n', '<Leader>ei', ':lua vim.lsp.buf.implementation()<CR>')
keymap('n', '<Leader>er', ':lua vim.lsp.buf.references()<CR>')
keymap('n', '<Leader>et', ':lua vim.lsp.buf.type_definition()<CR>')
keymap('n', '<Leader>ea', ':lua vim.lsp.buf.code_action()<CR>')
keymap('n', '<Leader>el', ':lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
keymap("n", "<Leader>ef", ":lua vim.lsp.buf.formatting()<CR>")
keymap('n', '<Leader>eg', ':lua vim.lsp.buf.signature_help()<CR>')
keymap('n', '<Leader>ee', ':lua vim.lsp.buf.rename()<CR>', {silent=false})
vim.api.nvim_command('autocmd BufWrite,BufEnter,InsertLeave * :lua fn.lsplocationlist()')

-- Fugitive Configurations
keymap('n', '<Leader>gs', ':Git<CR>')
keymap('n', '<Leader>gp', ':Git push<CR>')
keymap('n', '<Leader>gf', ':Git fetch<CR>')
keymap('n', '<Leader>gh', ':diffget //2<CR>')
keymap('n', '<Leader>gl', ':diffget //3<CR>')
