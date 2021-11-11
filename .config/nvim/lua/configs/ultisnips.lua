-- ultisnips triggers
vim.g.UltiSnipsExpandTrigger="<TAB>"
vim.g.UltiSnipsJumpForwardTrigger="<TAB>"
vim.g.UltiSnipsJumpBackwardTrigger="<S-TAB>"

vim.cmd[[
augroup ultisnips
  autocmd!
  au CmdwinEnter * call UltiSnips#LeavingBuffer()
  au CmdwinLeave * call UltiSnips#LeavingBuffer()
  au BufLeave * call UltiSnips#LeavingBuffer()
augroup END
]]
