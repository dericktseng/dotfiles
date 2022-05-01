-- cmp mappings
local cmp = require('cmp')
local luasnip = require('luasnip')
local fn = require('functions')

cmp.setup {
  mapping = {
    ['<C-P>'] = cmp.mapping.select_prev_item(),
    ['<C-N>'] = cmp.mapping.select_next_item(),
    ['<C-D>'] = cmp.mapping.scroll_docs(-4),
    ['<C-F>'] = cmp.mapping.scroll_docs(4),
    ['<C-SPACE>'] = cmp.mapping.complete(),
    ['<C-E>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),

    ["<Tab>"] = cmp.mapping(function(fallback)
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif fn.has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },

  sources = {
    {name = 'nvim_lua'},
    {name = 'nvim_lsp'},
    {name = 'path'},
    {name = 'luasnip', keyword_length = 3},
    {name = 'calc', keyword_length = 2},
    {name = 'buffer', keyword_length = 3},
  },

  snippet = {
    expand = function(args)
      require'luasnip'.lsp_expand(args.body)
    end,
  },

  experimental = {
    native_menu = false,
    ghost_text = false,
  }
}
