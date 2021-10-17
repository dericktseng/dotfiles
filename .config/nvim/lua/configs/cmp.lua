-- cmp mappings
local cmp = require('cmp')
cmp.setup {
  mapping = {
    ['<C-K>'] = cmp.mapping.select_prev_item(),
    ['<C-J>'] = cmp.mapping.select_next_item(),
    ['<C-D>'] = cmp.mapping.scroll_docs(-4),
    ['<C-F>'] = cmp.mapping.scroll_docs(4),
    ['<C-SPACE>'] = cmp.mapping.complete(),
    ['<C-E>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
  },
  sources = {
    {name = 'nvim_lsp'},
    {name = 'ultisnips'},
    {name = 'path'},
    {name = 'calc'},
    {name = 'buffer'},
  },
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  documentation = {
    border = 'rounded'
  },
}

-- source nvim-autopairs configuration 
-- here to ensure these get called after cmp is initialized
require('configs/pairs')
require('configs/lspservers')
