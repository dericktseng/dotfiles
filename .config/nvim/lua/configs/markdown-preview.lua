vim.cmd([[
function! OpenBrowserNewWindow(url)
  silent execute "!firefox -new-window " . a:url . "&"
endfunction
]])

vim.g.mkdp_auto_start = 0
vim.g.mkdp_browserfunc = 'OpenBrowserNewWindow'
