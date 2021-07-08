lua << EOF
vim.o.cursorline = true
vim.o.termguicolors = true
vim.o.background = 'light'
require('colorscheme')
EOF

" Neovim-QT specific settings
GuiPopupmenu 0
