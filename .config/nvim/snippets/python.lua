-- python comment styles for function using a restorenode
local inline_comment = sn(nil, {t('\t"""'), r(1, 'doc'), t('"""')})
local block_comment = sn(nil, fmta([[
<>"""
<><>
<>"""
]], {t('\t'), t('\t'), r(1, 'doc'), t('\t')}))

-- regular (non-auto) snippets
local regularsnips = {

  -- function definition
  s('def', fmta([[
    def <>(<>):
    <>
    <><>
  ]], {
    i(1, 'name'),
    i(2),
    c(3, { inline_comment, block_comment }),
    t('\t'),
    i(4)
  }), {stored = {doc = i(1, 'documentation')}}),

  -- comment
  s('///', fmta('"""<>"""', i(1))),

  -- if statements
  s('if', fmta([[
    if <>:
    <><>
  ]], {i(1), t('\t'), i(2)})
  ),
}

return regularsnips
