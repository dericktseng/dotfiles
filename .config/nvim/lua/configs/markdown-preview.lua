vim.cmd([[
function! OpenBrowserNewWindow(url)
    execute "silent !firefox --new-window " . a:url
endfunction
]])

vim.g.mkdp_auto_start = 1
vim.g.mkdp_browserfunc = 'OpenBrowserNewWindow'
