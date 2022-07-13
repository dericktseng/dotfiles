local utils = require'sniputils'

-- regular (non-auto) snippets
local regularsnips = {
  -- function definition
  s('fn', fmta([[
    fn <>(<>)<><> {
    <><>
    }
  ]], {
    i(1, 'name'),
    i(2),
    f(utils.cond_user_text, {3}, {user_args={' -> '}}),
    i(3),
    t('\t'),
    i(4)
  })),

  -- if statements
  s('if', fmta([[
    if <> {
    <><>
    }
  ]], {i(1), t('\t'), i(2)})),

  -- while loop
  s('while', fmta([[
    while <> {
    <><>
    }
  ]], {i(1), t('\t'), i(2)})),

  -- print statement
  s('pr', fmta([[
    println!("<>"<>);
  ]], {i(1), d(2, utils.generate_insert_nodes, {1}, {user_args={'{.-}'}})})),
}

return regularsnips
