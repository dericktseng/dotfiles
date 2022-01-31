-- LSP language-specific settings
local nvim_lsp = require('lspconfig')
local cmp_capability = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = {
  'pyright',
  'rust_analyzer',
  'clangd',
  -- 'texlab',
}

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    flags = {
      debounce_text_changes = 100,
    },
    capabilities = cmp_capability
  }
end

-- Other more specific configurations
-- require 'configs/lsp/texlab'
-- require 'configs/lsp/sumneko_lua'
