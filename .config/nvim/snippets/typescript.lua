local utils = require'sniputils'

-- regular (non-auto) snippets
local regularsnips = {
  s('///', fmta([[/** <> */]], i(1))),
}

return regularsnips
