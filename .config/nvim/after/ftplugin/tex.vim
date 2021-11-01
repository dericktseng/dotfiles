setlocal spell spelllang=en_us

set conceallevel=2
let g:tex_no_error=1
let g:tex_conceal='abdmgs'

nnoremap <silent> <Localleader>ll :TexlabBuild<CR>:TexlabForward<CR>
nnoremap <silent> <Localleader>lv :TexlabForward<CR>
