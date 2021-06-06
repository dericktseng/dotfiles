" display group name of currently selected word
function! g:SyntaxGroup() abort
    let l:s = synID(line('.'), col('.'), 1) 
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfunction
nnoremap <C-S-P> :call SyntaxGroup()<CR>

" removes highlights with <C-L>
nnoremap <C-L> :nohl<cr><C-L>

" enable folding with enter
nnoremap <silent> <TAB> @=(foldlevel('.')?'za':"\<TAB>")<CR>

" For long lines, go up or down one row rather than one line.
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

" control-w shortcut
nnoremap <silent> s <C-w>

" terminal drops focus on escape
tnoremap <Esc> <C-\><C-n>

" completion from popup
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" Leader shortcuts
let mapleader=";"

" quick tabnew
nnoremap <Leader>t :tabnew 

" fzf files
nnoremap <silent> <Leader>f :Files<CR>

" ALE definitions
nnoremap <silent> <Leader>n :ALENextWrap<CR>
nnoremap <silent> <Leader>m :ALEPreviousWrap<CR>
nnoremap <silent> <Leader>d :ALEGoToDefinition -tab<CR>
nnoremap <silent> <Leader>i :ALEInfo<CR>

