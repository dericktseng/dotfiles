" UltiSnips Settings
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

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

" Compe
lua << EOF
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end
EOF

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm({ 'keys': "\<Plug>delimitMateCR", 'mode': '' })
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <TAB>     v:lua.tab_complete()
inoremap <silent><expr> <S-TAB>   v:lua.s_tab_complete()
snoremap <silent><expr> <TAB>     v:lua.tab_complete()
snoremap <silent><expr> <S-TAB>   v:lua.s_tab_complete()

" Leader shortcuts
let mapleader=";"

" leader tabnew
nnoremap <Leader>t :tabnew 

" leader fzf
inoremap <expr> <c-f> fzf#vim#complete#path('fd --hidden')
nnoremap <silent> <Leader>f :Files<CR>

" LSP configuration
nnoremap <silent> <Leader>i :LspInfo<CR>
