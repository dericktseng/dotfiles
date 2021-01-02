" Settings for vimtex
let g:tex_flavor='latex'
let g:vimtex_view_general_viewer='zathura'
let g:vimtex_view_method='zathura'

let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'hooks' : [],
    \ 'options' : [
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

if has("nvim")
    let g:vimtex_compiler_progname = 'nvr'
    let g:vimtex_quickfix_mode=0
    let g:tex_conceal='abdmg'
    set conceallevel=1
    let g:vimtex_fold_manual=1
endif

