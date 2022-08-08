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
  s('inc', fmta([[
  #include <><><>
  ]], {
    c(2, {t("<"), t('"')}),
    i(1, 'stdio.h'),
    f(utils.close_func, {2}, {})
  })),

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
  s('pr', fmta([[
    printf("<>\n"<>);
  ]], {i(1), d(2, utils.generate_insert_nodes, {1}, {user_args={'%%[^%%]'}})})),

  -- fprintf statement
  s('fpr', fmta([[
    fprintf(<>, "<>\n"<>);
  ]], {i(1, 'stderr'), i(2), d(3, utils.generate_insert_nodes, {2}, {user_args={'%%[^%%]'}})})),
}

return regularsnips
