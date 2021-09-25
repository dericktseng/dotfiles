local fn = require("functions")

-- UltiSnips Settings
vim.g.UltiSnipsExpandTrigger = "<TAB>"
vim.g.UltiSnipsJumpForwardTrigger = "<TAB>"
vim.g.UltiSnipsJumpBackwardTrigger = "<S-TAB>"

-- Leader keys
fn.keymap('n', "<SPACE>", "<NOP>")
vim.g.mapleader = " "
vim.g.maplocalleader = ";"

-- gx shortcut fix
fn.keymap('n', 'gx', [[:execute 'silent! !xdg-open ' . shellescape(expand('<cWORD>'), 1)<CR>]])

-- quick spelling fixes
fn.keymap('i', '<C-E>', [[<c-g>u<Esc>[s1z=`]a<c-g>u]])
fn.keymap('n', '<C-E>', [[mz[s1z=`z]])

-- keymaps
fn.keymap('t', '<ESC>', [[<C-\><C-N>]])

fn.keymap('n', '<C-L>', [[:nohl<CR><C-L>]])
fn.keymap('n', 'k', [[(v:count > 5 ? "m'" . v:count : "") . v:lua.smart_nav('k')]], {expr=true})
fn.keymap('n', 'j', [[(v:count > 5 ? "m'" . v:count : "") . v:lua.smart_nav('j')]], {expr=true})
fn.keymap('n', '<C-J>', ':cnext<CR>')
fn.keymap('n', '<C-K>', ':cprev<CR>')
fn.keymap('n', '<C-Q>', [[:call v:lua.togglelist('c')<CR>]])
fn.keymap('n', '<LocalLeader>j', ':lnext<CR>')
fn.keymap('n', '<LocalLeader>k', ':lprev<CR>')
fn.keymap('n', '<LocalLeader>q', [[:call v:lua.togglelist('l')<CR>]])
fn.keymap('n', '<Leader>p', ':PackerSync<CR>')
fn.keymap('n', '<Leader>R', ':luafile %<CR>')
fn.keymap('n', 'Y', 'y$')
fn.keymap('n', 'n', 'nzzzv')
fn.keymap('n', 'N', 'Nzzzv')
fn.keymap('n', 'J', 'mzJ`z')
fn.keymap('n', 'W', ':w<CR>')
fn.keymap('n', '.', ';')
fn.keymap('v', '.', ';')
fn.keymap('n', '<Right>', '>>')
fn.keymap('n', '<Left>', '<<')
fn.keymap('n', '<Up>', ':m .-2<CR>==')
fn.keymap('n', '<Down>', ':m .+1<CR>==')

fn.keymap('i', ',', ',<c-g>u')
fn.keymap('i', '.', '.<c-g>u')
fn.keymap('i', '!', '!<c-g>u')
fn.keymap('i', '?', '?<c-g>u')
fn.keymap('i', ';', ';<c-g>u')
fn.keymap('i', '/', '/<c-g>u')
fn.keymap('i', '=', '=<c-g>u')

fn.keymap('v', 'H', [[<gv]])
fn.keymap('v', 'K', [[:m '<-2<CR>gv=gv]])
fn.keymap('v', 'J', [[:m '>+1<CR>gv=gv]])
fn.keymap('v', 'L', [[>gv]])

-- add surrounding brackets, quotes, etc
fn.keymap('v', '"', [[<esc>`>a"<esc>`<i"<esc>]])
fn.keymap('v', "'", [[<esc>`>a'<esc>`<i'<esc>]])
fn.keymap('v', '(', [[<esc>`>a)<esc>`<i(<esc>]])
fn.keymap('v', '[', [[<esc>`>a]<esc>`<i[<esc>]])
fn.keymap('v', '{', [[<esc>`>a}<esc>`<i{<esc>]])
fn.keymap('v', '|', [[<esc>`>a|<esc>`<i|<esc>]])

-- vim easy align
vim.cmd([[
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
]])

-- Splitting
fn.keymap('n', '<Leader>-', '<C-W>s')
fn.keymap('n', '<Leader>\\', '<C-W>v')
fn.keymap('n', '<Leader>h', '<C-W>h')
fn.keymap('n', '<Leader>j', '<C-W>j')
fn.keymap('n', '<Leader>k', '<C-W>k')
fn.keymap('n', '<Leader>l', '<C-W>l')
fn.keymap('n', '<Leader>o', ':only<CR>')
fn.keymap('n', '<Leader>H', '<C-W>H')
fn.keymap('n', '<Leader>J', '<C-W>J')
fn.keymap('n', '<Leader>K', '<C-W>K')
fn.keymap('n', '<Leader>L', '<C-W>L')
fn.keymap('n', 'gf', '<C-W>gf')

-- Tabs
fn.keymap('n', '<Leader>1', '1gt')
fn.keymap('n', '<Leader>2', '2gt')
fn.keymap('n', '<Leader>3', '3gt')
fn.keymap('n', '<Leader>4', '4gt')
fn.keymap('n', '<Leader>5', '5gt')
fn.keymap('n', '<Leader>6', '6gt')
fn.keymap('n', '<Leader>7', '7gt')
fn.keymap('n', '<Leader>8', '8gt')
fn.keymap('n', '<Leader>9', '9gt')
fn.keymap('n', '<Leader>0', ':tablast<CR>')

-- FZF
fn.keymap('i', '<C-F>', [[fzf#vim#complete#path('fd --hidden')]], {expr=true})
fn.keymap('n', '<Leader>ff', ':Files<CR>')
fn.keymap('n', '<Leader>fg', ':GFiles<CR>')
fn.keymap('n', '<Leader>vrc', ":Files $HOME/.config/nvim/<CR>")
fn.keymap('n', '<Leader>r', [[:Rg<CR>]])
fn.keymap('n', '<LocalLeader>lt', [[:call vimtex#fzf#run()<CR>]])

-- LSP Configurations
fn.keymap('n', ']d', ':lua vim.lsp.diagnostic.goto_next()<CR>')
fn.keymap('n', '[d', ':lua vim.lsp.diagnostic.goto_prev()<CR>')
fn.keymap('n', '<Leader>ed', ':lua vim.lsp.buf.definition()<CR>')
fn.keymap('n', '<Leader>eD', ':lua vim.lsp.buf.declaration()<CR>')
fn.keymap('n', '<Leader>es', ':lua vim.lsp.buf.document_symbol()<CR>')
fn.keymap('n', '<Leader>eh', ':lua vim.lsp.buf.hover()<CR>')
fn.keymap('n', '<Leader>ei', ':lua vim.lsp.buf.implementation()<CR>')
fn.keymap('n', '<Leader>er', ':lua vim.lsp.buf.references()<CR>')
fn.keymap('n', '<Leader>et', ':lua vim.lsp.buf.type_definition()<CR>')
fn.keymap('n', '<Leader>ea', ':lua vim.lsp.buf.code_action()<CR>')
fn.keymap('n', '<Leader>el', ':lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
fn.keymap("n", "<Leader>ef", ":lua vim.lsp.buf.formatting()<CR>")
fn.keymap('n', '<Leader>eg', ':lua vim.lsp.buf.signature_help()<CR>')
fn.keymap('n', '<Leader>ee', ':lua vim.lsp.buf.rename()<CR>', {silent=false})
vim.api.nvim_command('autocmd BufWrite,BufEnter,InsertLeave * :call v:lua.lsplocationlist()')

-- Fugitive Configurations
fn.keymap('n', '<Leader>gs', ':Git<CR>')
fn.keymap('n', '<Leader>gp', ':Git push<CR>')
fn.keymap('n', '<Leader>gf', ':Git fetch<CR>')
fn.keymap('n', '<Leader>gh', ':diffget //2<CR>')
fn.keymap('n', '<Leader>gl', ':diffget //3<CR>')
