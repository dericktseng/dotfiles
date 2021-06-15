local fn = require("functions")

-- exporting global functions
_G.completion_confirm = fn.completion_confirm
_G.smart_nav = fn.smart_nav
_G.p_complete = fn.pumvisible_complete
_G.syntax_group = fn.syntax_group

-- UltiSnips Settings
vim.g.UltiSnipsExpandTrigger = "<TAB>"
vim.g.UltiSnipsJumpForwardTrigger = "<TAB>"
vim.g.UltiSnipsJumpBackwardTrigger = "<S-TAB>"

-- Leader keys
fn.keymap('n', "<SPACE>", "<NOP>")
vim.g.mapleader = " "
vim.g.maplocalleader = ";"

-- keymaps
fn.keymap('t', '<ESC>', [[<C-\><C-N>]])

fn.keymap('n', '<C-Q>', [[:call v:lua.syntax_group()<CR>]], {silent=false})
fn.keymap('n', '<C-L>', [[:nohl<cr><C-L>]])
fn.keymap('n', 'k', [[v:lua.smart_nav('k')]], {expr=true})
fn.keymap('n', 'j', [[v:lua.smart_nav('j')]], {expr=true})

-- Compe mappings
fn.keymap('i', '<CR>', [[v:lua.completion_confirm('<CR>')]], {expr=true})
fn.keymap('i', '<C-SPACE>', [[compe#complete()]], {expr=true})
fn.keymap('i', '<C-E>', [[compe#close('<C-E>')]], {expr=true})
fn.keymap('i', '<C-J>', [[v:lua.p_complete('<C-N>', '<C-J>')]], {expr=true})
fn.keymap('i', '<C-K>', [[v:lua.p_complete('<C-P>', '<C-K>')]], {expr=true})
fn.keymap('s', '<C-J>', [[v:lua.p_complete('<C-N>', '<C-J>')]], {expr=true})
fn.keymap('s', '<C-K>', [[v:lua.p_complete('<C-P>', '<C-K>')]], {expr=true})

-- Splitting
fn.keymap('n', '<Leader>-', '<C-W>s')
fn.keymap('n', '<Leader>\\', '<C-W>v')
fn.keymap('n', '<Leader>h', '<C-W>h')
fn.keymap('n', '<Leader>j', '<C-W>j')
fn.keymap('n', '<Leader>k', '<C-W>k')
fn.keymap('n', '<Leader>l', '<C-W>l')
fn.keymap('n', '<Leader>o', ':only<CR>')
fn.keymap('n', '<Leader><S-H>', '<C-W><S-H>')
fn.keymap('n', '<Leader><S-J>', '<C-W><S-J>')
fn.keymap('n', '<Leader><S-K>', '<C-W><S-K>')
fn.keymap('n', '<Leader><S-L>', '<C-W><S-L>')
fn.keymap('n', '<Leader>gf', '<C-W>gf')

-- FZF
fn.keymap('i', '<C-F>', [[fzf#vim#complete#path('fd --hidden')]], {expr=true})
fn.keymap('n', '<Leader>f', [[:Files<CR>]])
fn.keymap('n', '<LocalLeader>lt', [[:call vimtex#fzf#run()<CR>]])

-- LSP Configurations
fn.keymap('n', '<Leader>en', ':lua vim.lsp.diagnostic.goto_next()<CR>')
fn.keymap('n', '<Leader>ep', ':lua vim.lsp.diagnostic.goto_prev()<CR>')
fn.keymap('n', '<Leader>ed', ':lua vim.lsp.buf.definition()<CR>')
fn.keymap('n', '<Leader>es', ':lua vim.lsp.buf.document_symbol()<CR>')
fn.keymap('n', '<Leader>eh', ':lua vim.lsp.buf.hover()<CR>')
fn.keymap('n', '<Leader>ei', ':lua vim.lsp.buf.implementation()<CR>')
fn.keymap('n', '<Leader>er', ':lua vim.lsp.buf.references()<CR>')
fn.keymap('n', '<Leader>et', ':lua vim.lsp.buf.type_definition()<CR>')
fn.keymap('n', '<Leader>ee', ':lua vim.lsp.buf.rename()<CR>', {silent=false})
