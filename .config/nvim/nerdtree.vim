" Nerdtree Configuration

" toggles nerdtree status
nnoremap <C-t> :NERDTreeToggle<CR><C-w>w
nnoremap <C-f> :NERDTreeFind<CR><C-w>w

" Start NERDTree and put the cursor back in the other window if filetype not blacklisted.
let blacklist = ['text', 'tex']
autocmd VimEnter * if index(blacklist, &ft) < 0 | NERDTree | wincmd p

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" better UI
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" resize
let g:NERDTreeWinSize=22
