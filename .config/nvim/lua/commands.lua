-- per filetype settings
groupnum = vim.api.nvim_create_augroup('vimrc', {clear=true})
vim.api.nvim_create_autocmd('TermOpen', {
  group = groupnum,
  command = 'startinsert',
  pattern = '*'
})

vim.api.nvim_create_user_command('Cwd', 'cd %:h', {})
