-- Opens a terminal already in insert mode.
groupnum = vim.api.nvim_create_augroup('vimrc', {clear=true})
vim.api.nvim_create_autocmd('TermOpen', {
  group = groupnum,
  command = 'startinsert',
  pattern = '*'
})

-- Cwd to change working directory to the parent of the current buffer
vim.api.nvim_create_user_command('Cwd', 'cd %:h', {})
