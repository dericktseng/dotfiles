local utils = require'sniputils'

-- regular (non-auto) snippets
local regularsnips = {
  -- function definition
  s('fn', fmta([[
    <> <>(<>) {
    <><>
    }
  ]], {
    i(1, 'void'),
    i(2, 'fn_name'),
    i(3),
    t('\t'),
    i(4, 'return;')
  })),

  -- comment
  s('///', fmta([[
  /* <> */
  ]], {i(1)})),

  -- if statements
  s('if', fmta([[
    if (<>) {
    <><>
    }
  ]], { i(1), t('\t'), i(2)})),

  -- #include
  s('inc', fmt([[
  #include <{}>
  ]], { i(1, 'iostream') })),

  s('incc', fmt([[
  #include "{}"
  ]], { i(1) })),

  -- while loop
  s('while', fmta([[
    while (<>) {
    <><>
    }
  ]], {i(1), t('\t'), i(2)})),

  -- for loop
  s('for', fmta([[
    for (<>; <>; <>) {
    <><>
    }
  ]], {i(1), i(2), i(3), t('\t'), i(4)})),

  -- printf statement
  s('pr', fmt([[
    std::cout << {} << std::endl;
  ]], {i(1)})),
}

return regularsnips
