local utils = require'sniputils'

-- regular (non-auto) snippets
local regularsnips = {
  -- function definition
  s('fn', fmta([[
    fn <>(<>) <><> {
    <><>
    }
  ]], {
    i(1, 'name'),
    i(2, 'args'),
    f(function(args) return args[1][1] ~= "" and "-> " or "" end, {3}, {}),
    i(3),
    t('\t'),
    i(4)
  })),

  -- if statements
  s('if', fmta([[
    if <> {
    <><>
    }
  ]], {i(1), t('\t'), i(2)})
  ),

  s('while', fmta([[
  while <> {
  <><>
  }
  ]], {i(1), t('\t'), i(2)})),
}

return regularsnips
