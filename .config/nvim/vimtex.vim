" Settings for vimtex
let g:tex_no_error=1

if (&ft=='tex')
    " shortcuts
    nnoremap <localleader>lt :call vimtex#fzf#run('ctli', g:fzf_colors)<cr>

    let g:vimtex_view_general_viewer='zathura'
    let g:vimtex_view_method='zathura'
    let g:vimtex_fold_enabled=0
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

    let g:vimtex_mappings_disable = {
        \ 'i': [']]']
      \ }

    " non-vimtex settings help: tex-math
    let g:tex_flavor='latex'
    set conceallevel=2
    set omnifunc=vimtex#complete#omnifunc
    setlocal spell spelllang=en_us
	call TexNewMathZone("M", "align", 1)

endif
