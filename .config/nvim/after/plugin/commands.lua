-- Opens a terminal already in insert mode.
local groupnum = vim.api.nvim_create_augroup('vimrc', {clear=true})
vim.api.nvim_create_autocmd('TermOpen', {
  group = groupnum,
  command = 'startinsert',
  pattern = '*'
})

vim.api.nvim_create_autocmd('TextYankPost', {
  group = groupnum,
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 200 }
  end,
})

-- Cwd to change working directory to the parent of the current buffer
vim.api.nvim_create_user_command('Cwd', 'cd %:h', {})

-- luasnip custom command
vim.api.nvim_create_user_command('LuaSnipEdit', require('luasnip.loaders').edit_snippet_files, {})
