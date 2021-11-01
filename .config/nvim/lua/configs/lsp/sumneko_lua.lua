-- set the path to the sumneko installation
local sumneko_binary
if vim.fn.has("mac") == 1 then
  print("Please set binary path")
elseif vim.fn.has("unix") == 1 then
  sumneko_binary = "/bin/lua-language-server"
elseif vim.fn.has('win32') == 1 then
  print("Please set binary path")
else
  print("Unsupported system for sumneko")
end

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
  cmd = { sumneko_binary };
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },

      completion = { callSnippet = 'Both' },

      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },

      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        maxPreload = 2000,
        preloadFileSize = 50000,
      },

      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = { enable = false },
    },
  },
}
