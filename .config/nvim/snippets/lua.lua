return {
  -- function
  s('fn', fmta([[
    function <>(<>)
    <><>
    end
  ]], {
    i(1, 'functionName'),
    i(2),
    t('\t'),
    i(3)
  })),

  -- function without name
  s('fnn', fmta([[
    function(<>)
    <><>
    end
  ]], {i(1), t('\t'), i(2)})),

  -- if statement
  s('if', {
    t('if '), i(1), t({' then', '\t'}),
    i(2),
    t({'', 'end'})
  }),

  -- for loop
  s('for', fmta([[
  for <> in <> do
  <><>
  end
  ]], {i(1), i(2), t('\t'), i(3)}))
}
