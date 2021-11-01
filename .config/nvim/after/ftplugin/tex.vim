setlocal spell spelllang=en_us

set conceallevel=2
let g:tex_no_error=1
let g:tex_conceal='abdmgs'

" sets wrap mode only in latex
set wrap
set linebreak
let &showbreak = '|'

nnoremap <silent> <Localleader>ll :TexlabBuild<CR>:TexlabForward<CR>
nnoremap <silent> <Localleader>lv :TexlabForward<CR>
