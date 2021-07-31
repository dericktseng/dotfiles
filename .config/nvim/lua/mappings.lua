local fn = require("functions")

-- exporting global functions
_G.completion_confirm = fn.completion_confirm
_G.smart_nav = fn.smart_nav
_G.p_complete = fn.pumvisible_complete
_G.syntax_group = fn.syntax_group
_G.lsplocationlist = fn.lsplocationlist
_G.togglelist = fn.togglelist

-- UltiSnips Settings
vim.g.UltiSnipsExpandTrigger = "<TAB>"
vim.g.UltiSnipsJumpForwardTrigger = "<TAB>"
vim.g.UltiSnipsJumpBackwardTrigger = "<S-TAB>"

-- Leader keys
fn.keymap('n', "<SPACE>", "<NOP>")
vim.g.mapleader = " "
vim.g.maplocalleader = ";"

-- gx shortcut fix
fn.keymap('n', 'gx', [[<Cmd>execute 'silent! !xdg-open ' . shellescape(expand('<cWORD>'), 1)<CR>]])

-- keymaps
fn.keymap('t', '<ESC>', [[<C-\><C-N>]])

-- fn.keymap('n', '<>', [[<Cmd>call v:lua.syntax_group()<CR>]], {silent=false})
fn.keymap('n', '<C-L>', [[<Cmd>nohl<cr><C-L>]])
fn.keymap('n', 'k', [[(v:count > 5 ? "m'" . v:count : "") . v:lua.smart_nav('k')]], {expr=true})
fn.keymap('n', 'j', [[(v:count > 5 ? "m'" . v:count : "") . v:lua.smart_nav('j')]], {expr=true})
fn.keymap('n', '.', ';')
fn.keymap('n', '<C-J>', '<Cmd>cnext<CR>')
fn.keymap('n', '<C-K>', '<Cmd>cprev<CR>')
fn.keymap('n', '<C-Q>', [[<Cmd>call v:lua.togglelist('c')<CR>]])
fn.keymap('n', '<LocalLeader>j', '<Cmd>lnext<CR>')
fn.keymap('n', '<LocalLeader>k', '<Cmd>lprev<CR>')
fn.keymap('n', '<LocalLeader>q', [[<Cmd>call v:lua.togglelist('l')<CR>]])
fn.keymap('n', 'Y', 'y$')
fn.keymap('n', 'n', 'nzzzv')
fn.keymap('n', 'N', 'Nzzzv')
fn.keymap('n', 'J', 'mzJ`z')

fn.keymap('i', ',', ',<c-g>u')
fn.keymap('i', '.', '.<c-g>u')
fn.keymap('i', '!', '!<c-g>u')
fn.keymap('i', '?', '?<c-g>u')
fn.keymap('i', ';', ';<c-g>u')
fn.keymap('i', '/', '/<c-g>u')

fn.keymap('v', 'H', [[<gv]])
fn.keymap('v', 'K', [[:m '<-2<CR>gv=gv]])
fn.keymap('v', 'J', [[:m '>+1<CR>gv=gv]])
fn.keymap('v', 'L', [[>gv]])

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
fn.keymap('n', '<Leader>o', '<Cmd>only<CR>')
fn.keymap('n', '<Leader><S-H>', '<C-W><S-H>')
fn.keymap('n', '<Leader><S-J>', '<C-W><S-J>')
fn.keymap('n', '<Leader><S-K>', '<C-W><S-K>')
fn.keymap('n', '<Leader><S-L>', '<C-W><S-L>')
fn.keymap('n', '<Leader>gf', '<C-W>gf')

-- FZF
fn.keymap('i', '<C-F>', [[fzf#vim#complete#path('fd --hidden')]], {expr=true})
fn.keymap('n', '<Leader>f', [[(len(system('git rev-parse')) ? ':Files' : ':GFiles')."\<CR>"]], {expr=true})
fn.keymap('n', '<Leader>vrc', "<Cmd>Files $HOME/.config/nvim/<CR>")
fn.keymap('n', '<Leader>r', [[<Cmd>Rg<CR>]])
fn.keymap('n', '<LocalLeader>lt', [[:call vimtex#fzf#run()<CR>]])

-- LSP Configurations
fn.keymap('n', ']d', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
fn.keymap('n', '[d', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
fn.keymap('n', '<Leader>ed', '<Cmd>lua vim.lsp.buf.definition()<CR>')
fn.keymap('n', '<Leader>eD', '<Cmd>lua vim.lsp.buf.declaration()<CR>')
fn.keymap('n', '<Leader>es', '<Cmd>lua vim.lsp.buf.document_symbol()<CR>')
fn.keymap('n', '<Leader>eh', '<Cmd>lua vim.lsp.buf.hover()<CR>')
fn.keymap('n', '<Leader>ei', '<Cmd>lua vim.lsp.buf.implementation()<CR>')
fn.keymap('n', '<Leader>er', '<Cmd>lua vim.lsp.buf.references()<CR>')
fn.keymap('n', '<Leader>et', '<Cmd>lua vim.lsp.buf.type_definition()<CR>')
fn.keymap('n', '<Leader>ea', '<Cmd>lua vim.lsp.buf.code_action()<CR>')
fn.keymap('n', '<Leader>el', '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
fn.keymap("n", "<Leader>ef", "<Cmd>lua vim.lsp.buf.formatting()<CR>")
fn.keymap('n', '<Leader>eg', '<Cmd>lua vim.lsp.buf.signature_help()<CR>')
fn.keymap('n', '<Leader>ee', '<Cmd>lua vim.lsp.buf.rename()<CR>', {silent=false})
vim.api.nvim_command('autocmd BufWrite,BufEnter,InsertLeave * :call v:lua.lsplocationlist()')

-- Fugitive Configurations
fn.keymap('n', '<Leader>gs', '<Cmd>Git<CR>')
fn.keymap('n', '<Leader>gp', '<Cmd>Git push<CR>')
fn.keymap('n', '<Leader>gh', '<Cmd>diffget //2<CR>')
fn.keymap('n', '<Leader>gl', '<Cmd>diffget //3<CR>')

