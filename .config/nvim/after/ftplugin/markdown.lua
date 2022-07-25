vim.opt_local.concealcursor = "nc"
vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.showbreak = "|"
vim.opt_local.spell = true
vim.opt_local.spelllang = "en_us"
vim.api.nvim_buf_set_keymap(0, 'n', '<LocalLeader>l', '<Cmd>MarkdownPreviewToggle<CR>', {noremap=true})
