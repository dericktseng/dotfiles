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
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

ls.add_snippets('lua', {
  s('fn', fmta([[
    <>function <>(<>)
    <><>
    end
  ]], {
    c(1, {t('local '), t('')}),
    i(2, 'functionName'),
    i(3),
    t('\t'),
    i(4)
  })),

  s('fnn', fmta([[
    function(<>)
    <><>
    end
  ]], {i(1), t('\t'), i(2)})),

  s('if', {
    t('if '), i(1), t({' then', '\t'}),
    i(2),
    t({'', 'end'})
  }),
})
