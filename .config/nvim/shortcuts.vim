" UltiSnips Settings
let g:UltiSnipsSnippetsDir = "~/.config/nvim/UltiSnips"
let g:UltiSnipsExpandTrigger="<C-J>"
let g:UltiSnipsJumpForwardTrigger="<C-J>"
let g:UltiSnipsJumpBackwardTrigger="<C-K>"

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

" any changes to tab completion shortcuts should be reflected in functions.lua
inoremap <silent><expr> <TAB>     v:lua.tab_complete()
inoremap <silent><expr> <S-TAB>   v:lua.s_tab_complete()
snoremap <silent>       <TAB>     <Esc>:call UltiSnips#ExpandSnippetOrJump()<cr>
snoremap <silent>       <S-TAB>   <Esc>:call UltiSnips#JumpBackwards()<cr>

" Leader shortcuts
let mapleader=";"

nnoremap          <Leader><S-S> :source ~/.config/nvim/init.vim<CR>

" fzf
inoremap <expr>   <c-f>         fzf#vim#complete#path('fd --hidden')
nnoremap <silent> <Leader>f     :Files<CR>

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
nnoremap          <Leader><S-R> :lua vim.lsp.buf.rename()<Left>
