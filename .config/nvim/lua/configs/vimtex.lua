if (vim.bo.filetype == 'tex') then
    vim.o.omnifunc = vim.fn['vimtex#complete#omnifunc']()
end

-- settings for vimtex
vim.g.vimtex_view_general_viewer = 'qpdfview'
vim.g.vimtex_view_general_options = [[--unique @pdf\#src:@tex:@line:@col]]
vim.g.vimtex_view_general_options_latexmk = '--unique'
vim.g.vimtex_complete_enabled = 1
vim.g.vimtex_compiler_progname = 'nvr'
vim.g.vimtex_quickfix_mode = 0

vim.g.vimtex_compiler_latexmk = {
    ['build_dir'] = '',
    ['callback'] = 1,
    ['continuous'] = 1,
    ['executable'] = 'latexmk',
    ['hooks'] = {},
    ['options'] = {
        '-verbose',
        '-file-line-error',
        '-interaction=nonstopmode',
        '-synctex=1'
    }
}

vim.g.vimtex_syntax_conceal = {
    ['accents'] = 1,
    ['fancy'] = 0,
    ['math_bounds'] = 1,
    ['math_delimiters'] = 1,
    ['math_fracs'] = 0,
    ['math_super_sub'] = 1,
    ['math_symbols'] = 1,
    ['styles'] = 1
}
