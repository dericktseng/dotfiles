require'luasnip'.config.setup({
  update_events = 'TextChanged,TextChangedI',
  region_check_events = "InsertEnter",
  enable_autosnippets = true
})

require('luasnip.loaders.from_lua').lazy_load({paths = "./snippets"})
