-- cmp mappings
local cmp = require('cmp')
local lspkind = require('lspkind')
cmp.setup {
  mapping = {
    ['<C-K>'] = cmp.mapping.select_prev_item(),
    ['<C-J>'] = cmp.mapping.select_next_item(),
    ['<C-D>'] = cmp.mapping.scroll_docs(-4),
    ['<C-F>'] = cmp.mapping.scroll_docs(4),
    ['<C-SPACE>'] = cmp.mapping.complete(),
    ['<C-E>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
  },

  sources = {
    {name = 'nvim_lua'},
    {name = 'nvim_lsp'},
    {name = 'path'},
    {name = 'ultisnips'},
    {name = 'calc', keyword_length = 2},
    {name = 'buffer', keyword_length = 3},
  },

  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        nvim_lua = "[lua]",
        nvim_lsp = "[LSP]",
        ultisnips = "[snip]",
        path = "[path]",
        calc = "[calc]",
        buffer = "[buf]",
      }
    }
  },

  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },

  documentation = {
    border = 'rounded'
  },

  experimental = {
    native_menu = false,
    ghost_text = false,
  }
}

-- source nvim-autopairs configuration
-- here to ensure these get called after cmp is initialized
require('configs.lspservers')
