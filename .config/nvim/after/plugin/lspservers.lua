-- LSP language-specific settings
local cmp_capability = require('cmp_nvim_lsp').default_capabilities()

-- make sure these lsp servers are installed
local servers = {
  'ruff',
  'pyright',
  'rust_analyzer',
  'clangd',
  'texlab',
  'ts_ls',
  'sqruff',
}

-- setup mason
require"mason".setup()
require("mason-lspconfig").setup({
  automatic_installation = true,
  automatic_enable = true,
  ensure_installed = servers
})
