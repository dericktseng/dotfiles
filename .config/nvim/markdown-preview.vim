" Markdown Preview Settings
function! OpenBrowserNewWindow(url)
    execute "silent !firefox --new-window " . a:url
endfunction
let g:mkdp_auto_start = 1
let g:mkdp_auto_close = 1
let g:mkdp_browserfunc = 'OpenBrowserNewWindow'
