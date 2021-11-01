-- texlab settings
local lspconfig = require'lspconfig'
lspconfig.texlab.setup{
  settings = {
    texlab = {
      build = {
        executable = "latexmk",
        forwardSearchAfter = false,
        onSave = true,
        args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
      },
      auxDirectory = '.',
      chktex = {
        onOpenAndSave = false,
        onEdit = false,
      },
      forwardSearch = {
        executable = "zathura",
        args = { "--synctex-forward", "%l:1:%f", "%p" },
      },
      latexFormatter = 'latexindent'
    }
  }
}
