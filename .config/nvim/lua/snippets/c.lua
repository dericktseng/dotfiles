local ls = require'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local sn = ls.snippet_node
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep
local utils = require'snippets.utils'

ls.add_snippets('c', {
  -- function definition
  s('fn', fmta([[
    <> <>(<>) {
    <><>
    }
  ]], {
    i(1, 'type'),
    i(2, 'name'),
    i(3),
    t('\t'),
    i(4)
  })),

  -- if statements
  s('if', fmta([[
    if (<>) {
    <><>
    }
  ]], {i(1), t('\t'), i(2)})
  ),

  -- #include
  s('inc', fmta([[
  #include <><><>
  ]], {
    c(1, {t("<"), t('"')}),
    i(2, 'stdio.h'),
    f(utils.close_func, {1}, {})
  })),
})
