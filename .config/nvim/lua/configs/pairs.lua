local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')

-- sourced in cmp.lua to make sure this comes after
npairs.setup{
  check_ts = true,
  enable_check_bracket_line = false,
  fast_wrap = {
    map = '<M-W>',
    end_key = '$'
  },
}

-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

-- add a lisp filetype (wrap my-function), FYI: Hardcoded = { "clojure", "clojurescript", "fennel", "janet" }
cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"

-- you can use some built-in condition

npairs.add_rules({
  Rule("$", "$", {"tex", "latex"})
  -- don't add a pair if the next or previous character is %
  :with_pair(cond.not_before_text("$"))
  :with_pair(cond.not_after_text("$"))

  -- disable add newline when press <cr>
  :with_cr(cond.none())
})
