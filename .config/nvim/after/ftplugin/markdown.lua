vim.opt_local.concealcursor = "nc"
vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.showbreak = "|"
vim.opt_local.spell = true
vim.opt_local.spelllang = "en_us"

-- markdown preview settings
vim.api.nvim_buf_set_keymap(0, 'n', '<LocalLeader>l', '<Cmd>MarkdownPreviewToggle<CR>', {noremap=true})
vim.cmd([[
function! OpenBrowserNewWindow(url)
  silent execute "!flatpak run io.gitlab.librewolf-community -new-window " . a:url . "&"
endfunction
]])

vim.g.mkdp_auto_start = 0
vim.g.mkdp_browserfunc = 'OpenBrowserNewWindow'
