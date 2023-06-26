local fn = require('functions')

vim.api.nvim_create_user_command('AutoRun', function()
  fn.autorun_cmd('cargo run')
end, {})

vim.api.nvim_create_user_command('AutoTest', function()
  fn.autorun_cmd('cargo test')
end, {})
