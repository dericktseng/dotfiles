" UltiSnips Settings
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

" display group name of currently selected word
function! g:SyntaxGroup() abort
    let l:s = synID(line('.'), col('.'), 1) 
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfunction
nnoremap <C-q> :call SyntaxGroup()<CR>

" removes highlights with <C-L>
nnoremap <C-L> :nohl<cr><C-L>

" enable folding with enter
nnoremap <silent> <TAB> @=(foldlevel('.')?'za':"\<TAB>")<CR>

" For long lines, go up or down one row rather than one line.
nnoremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')

" control-w shortcut
nnoremap <silent> s <C-w>

" terminal drops focus on escape
tnoremap <Esc> <C-\><C-n>

" Compe
inoremap <silent><expr> <CR>      compe#confirm({ 'keys': "\<Plug>delimitMateCR", 'mode': '' })
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <C-e>     compe#close('<C-e>')

" any changes to tab completion shortcuts should be reflected in init.vim
inoremap <silent><expr> <TAB>     v:lua.tab_complete()
inoremap <silent><expr> <S-TAB>   v:lua.s_tab_complete()
snoremap <silent><expr> <TAB>     v:lua.tab_complete()
snoremap <silent><expr> <S-TAB>   v:lua.s_tab_complete()

" Leader shortcuts
let mapleader=";"

" leader tabnew
nnoremap <Leader>t :tabnew 

" fzf
inoremap <expr> <c-f> fzf#vim#complete#path('fd --hidden')
nnoremap <silent> <Leader>f :Files<CR>

" LSP configuration
nnoremap <silent> <Leader>i :LspInfo<CR>
nnoremap <silent> <Leader>n :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> <Leader><S-n> :lua vim.lsp.diagnostic.goto_prev()<CR>
