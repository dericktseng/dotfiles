local ls = require'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local sn = ls.snippet_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

ls.add_snippets('lua', {
  s('fn', {
    c(1, {t('local '), t('')}), t('function '), i(2, 'FunctionName'), t('('), i(3), t({')', '\t'}),
    i(4),
   t({'', 'end'}),
  }),

  s('if', {
    t('if '), i(1), t({' then', '\t'}),
    i(2),
    t({'', 'end'})
  }),
})
