-- LSP language-specific settings
local nvim_lsp = require('lspconfig')
local cmp_capability = require('cmp_nvim_lsp').default_capabilities()

-- make sure these lsp servers are installed
local servers = {
  'pyright',
  'rust_analyzer',
  'clangd',
  -- 'texlab',
}

-- setup mason
require'mason'.setup()
require("mason-lspconfig").setup({
  automatic_installation = true
})

-- attaches cmp capabilities to every lsp
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    flags = { debounce_text_changes = 100 },
    capabilities = cmp_capability
  }
end
