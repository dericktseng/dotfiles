-- LSP language-specific settings
local nvim_lsp = require('lspconfig')
local cmp_capability = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())


-- setup mason
require'mason'.setup()
require'mason-tool-installer'.setup {
  auto_update = false,
  run_on_start = false,
  ensure_installed = {
    'pyright',
    'rust-analyzer',
  },
}

-- make sure these lsp servers are installed
local servers = {
  'pyright',
  'rust_analyzer',
  'clangd',
  -- 'texlab',
}

-- attaches cmp capabilities to every lsp
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    flags = { debounce_text_changes = 100 },
    capabilities = cmp_capability
  }
end
