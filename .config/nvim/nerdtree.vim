" Nerdtree Configuration

" toggles nerdtree status
nnoremap <C-t> :NERDTreeToggle<CR><C-w>w

" Start NERDTree and put the cursor back in the other window if filetype not blacklisted.
let blacklist = ['tex']
autocmd VimEnter * if index(blacklist, &ft) < 0 | NERDTree | wincmd p

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" better UI
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
