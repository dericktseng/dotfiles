let g:UltiSnipsExpandTrigger="<TAB>"
let g:UltiSnipsJumpForwardTrigger="<TAB>"
let g:UltiSnipsJumpBackwardTrigger="<S-TAB>"

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
inoremap <silent><expr> <CR>      v:lua.completion_confirm()
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <C-e>     compe#close('<C-e>')

" any changes to completion shortcuts should be reflected in functions.lua
inoremap <silent><expr> <C-J> pumvisible() ? "\<C-N>" : "\<C-J>"
inoremap <silent><expr> <C-K> pumvisible() ? "\<C-P>" : "\<C-K>"
snoremap <silent><expr> <C-J> pumvisible() ? "\<C-N>" : "\<C-J>"
snoremap <silent><expr> <C-K> pumvisible() ? "\<C-P>" : "\<C-K>"

" Leader shortcuts
let mapleader=";"
let maplocalleader="\\"

" Source init.lua
nnoremap <silent> <Leader><S-S> :luafile ~/.config/nvim/init.lua<CR>:luafile ~/.config/nvim/lua/colorscheme.lua<CR>

" fzf
inoremap <expr>   <c-f>         fzf#vim#complete#path('fd --hidden')
nnoremap <silent> <Leader>f     :Files<CR>
nnoremap <silent> <localleader>t :call vimtex#fzf#run()<cr>

" LSP configuration
nnoremap <silent> <Leader><S-I> :LspInfo<CR>
nnoremap <silent> <Leader>n     :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> <Leader><S-N> :lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <Leader>d     :lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <Leader>s     :lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> <Leader>h     :lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <Leader>i     :lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <Leader>r     :lua vim.lsp.buf.references()<CR>
nnoremap <silent> <Leader>t     :lua vim.lsp.buf.type_definition()<CR>
nnoremap          <Leader><S-R> :lua vim.lsp.buf.rename()<CR>
