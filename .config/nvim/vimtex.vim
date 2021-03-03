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

let g:vimtex_compiler_progname = "nvr"
let g:vimtex_quickfix_mode=0
" let g:vimtex_fold_manual=1
" let g:vimtex_fold_enabled=1
" let g:tex_conceal="abdmgs"
let g:vimtex_syntax_conceal = {
    \ 'accents': 1,
    \ 'fancy': 0,
    \ 'math_bounds': 0,
    \ 'math_delimiters': 1,
    \ 'math_fracs': 0,
    \ 'math_super_sub': 1,
    \ 'math_symbols': 1,
    \ 'styles': 1,
  \ }
set conceallevel=2
