lua << EOF
vim.o.cursorline = true
vim.o.termguicolors = true
vim.o.background = 'light'
require'balance'.setup()
EOF

" Neovim-QT specific settings
GuiPopupmenu 0
GuiTabline 0
