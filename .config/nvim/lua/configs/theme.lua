-- only enable theme when in light background mode
if vim.o.background == 'light' then
  require'balance'.setup()
end

require('lualine').setup{
  options = {
    icons_enabled = false,
    theme = 'onelight',
    section_separators = {'', ''},
  },
}
