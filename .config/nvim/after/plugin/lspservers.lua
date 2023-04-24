-- LSP language-specific settings
local cmp_capability = require('cmp_nvim_lsp').default_capabilities()

-- make sure these lsp servers are installed
local servers = {
  'pyright',
  'rust_analyzer',
  'clangd',
  'lua_ls',
  'texlab',
}

-- setup mason
require'mason'.setup()
require("mason-lspconfig").setup({
  automatic_installation = true,
  ensure_installed = servers
})

require('mason-lspconfig').setup_handlers {
  function (server_name) -- default handler
    require('lspconfig')[server_name].setup({
      flags = { debounce_text_changes = 100 },
      capabilities = cmp_capability
    })
  end,

  -- override handlers
  ['lua_ls'] = function()
    require('lspconfig').lua_ls.setup({
      flags = { debounce_text_changes = 100 },
      capabilities = cmp_capability,
      settings = {
        Lua = {
          runtime = { version = 'LuaJIT' },
          diagnostics = { globals = {'vim'} },
          -- workspace = { library = vim.api.nvim_get_runtime_file("", true) },
          telemetry = { enable = false, },
        },
      }
    })
  end
}
