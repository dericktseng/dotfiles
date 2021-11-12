-- sets the conceallevel
vim.opt.conceallevel = 2

-- settings for vimtex
vim.g.vimtex_view_general_viewer = 'xdg-open'
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_complete_enabled = 0
vim.g.vimtex_compiler_progname = 'nvr'
vim.g.vimtex_quickfix_mode = 0

vim.g.vimtex_compiler_latexmk = {
  ['build_dir'] = '',
  ['callback'] = 1,
  ['continuous'] = 1,
  ['executable'] = 'latexmk',
  ['hooks'] = {},
  ['options'] = {
    '-pdf',
    '-interaction=nonstopmode',
    '-synctex=1'
  }
}

vim.g.vimtex_syntax_conceal = {
  ['accents'] = 1,
  ['cites'] = 1,
  ['fancy'] = 0,
  ['greek'] = 1,
  ['math_bounds'] = 1,
  ['math_delimiters'] = 1,
  ['math_fracs'] = 0,
  ['math_super_sub'] = 1,
  ['math_symbols'] = 1,
  ['sections'] = 1,
  ['styles'] = 1
}
