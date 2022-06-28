-- only enable theme when in light background mode
if vim.o.background == 'light' then
  require'balance'.setup({
    attr = {undercurl = 'underline'}
  })
end

require('lualine').setup{
  options = {
    icons_enabled = false,
    theme = 'onelight',
    section_separators = {'', ''},
  },
}
