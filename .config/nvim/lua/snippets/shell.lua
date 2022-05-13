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

ls.add_snippets('sh', {
  s('fn', fmt([[
    function {}() {{
    {}{}
    }}
  ]], {i(1), t('\t'), i(2)})),

  s('if', fmt([=[
  if [[ {} ]]; then
  {}{}
  fi
  ]=], {i(1), t('\t'), i(2)})
  ),
})
