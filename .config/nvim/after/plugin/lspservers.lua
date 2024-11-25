-- LSP language-specific settings
local cmp_capability = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

-- make sure these lsp servers are installed
local servers = {
  'ruff',
  'pyright',
  'rust_analyzer',
  'clangd',
  'lua_ls',
  'texlab',
  'ts_ls'
}

-- setup mason
require"mason".setup()
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
}

-- lua_ls configuration
lspconfig.lua_ls.setup {
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
      return
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = { version = 'LuaJIT' },
      workspace = {
        checkThirdParty = false,
        library = { vim.env.VIMRUNTIME }
      }
    })
  end,

  settings = {
    Lua = {
      diagnostics = { globals = {'vim'} },
      telemetry = { enable = false, },
    }
  }
}

-- gdscript configuration
lspconfig.gdscript.setup{}
