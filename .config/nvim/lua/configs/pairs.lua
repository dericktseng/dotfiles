-- sourced in cmp.lua to make sure this comes after
require('nvim-autopairs').setup{}

local Rule = require('nvim-autopairs.rule')
local npairs = require('nvim-autopairs')

-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done())


-- you can use some built-in condition
local cond = require('nvim-autopairs.conds')

npairs.add_rules({
  Rule("$", "$",{"tex", "latex"})
  -- don't add a pair if the next character is %
  :with_pair(cond.not_after_regex_check("%%"))
  -- disable add newline when press <cr>
  :with_cr(cond.none())
})
