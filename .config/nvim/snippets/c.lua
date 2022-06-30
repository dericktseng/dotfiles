local utils = require'sniputils'

-- regular (non-auto) snippets
local regularsnips = {
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
    c(2, {t("<"), t('"')}),
    i(1, 'stdio.h'),
    f(utils.close_func, {2}, {})
  })),

  s('while', fmta([[
  while (<>) {
  <><>
  }
  ]], {i(1), t('\t'), i(2)})),
}

return regularsnips
