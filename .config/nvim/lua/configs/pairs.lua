-- sourced in cmp.lua to make sure this comes after
local Rule = require('nvim-autopairs.rule')
local npairs = require('nvim-autopairs')

-- nvim auto pairs; you need setup cmp first put this after cmp.setup()
require("nvim-autopairs.completion.cmp").setup({
	map_cr = true, --  map <CR> on insert mode
	map_complete = true, -- it will auto insert `(` after select function or method item
	auto_select = true, -- automatically select the first item
	insert = false, -- use insert confirm behavior instead of replace
})


-- you can use some built-in condition
local cond = require('nvim-autopairs.conds')

npairs.add_rules({
  Rule("$", "$",{"tex", "latex"})
    -- don't add a pair if the next character is %
    :with_pair(cond.not_after_regex_check("%%"))
    -- don't add a pair if  the previous character is xxx
    :with_pair(cond.not_before_regex_check("xxx", 3))
    -- don't move right when repeat character
    :with_move(cond.none())
    -- don't delete if the next character is xx
    :with_del(cond.not_after_regex_check("xx"))
    -- disable add newline when press <cr>
    :with_cr(cond.none())
  },
  --it is not working on .vim but it working on another filetype
  Rule("a","a","-vim")
)
