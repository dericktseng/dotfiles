" Settings for vimtex
let g:tex_flavor='latex'
let g:vimtex_view_general_viewer='zathura'
let g:vimtex_view_method='zathura'
let g:vimtex_fold_enabled=1
let g:vimtex_complete_enabled=1

set fillchars=fold:\ 

let g:vimtex_fold_types = {
    \ 'envs' : {
    \   'blacklist' : ['align', 'align*', 'equation', 'equation*']
    \ }
  \ }

let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'hooks' : [],
    \ 'options' : [
    \   '-verbose',
    \   '-file-line-error',
    \   '-interaction=nonstopmode',
    \   '-synctex=1',
    \ ],
    \}

let g:vimtex_compiler_progname = "nvr"
let g:vimtex_quickfix_mode=0
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

let g:vimtex_mappings_disable = {
    \ 'i': [']]']
  \ }

if (&ft=='tex')
    set omnifunc=vimtex#complete#omnifunc
endif
