local ls = require'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local utils = require'snippets.utils'
local captured = utils.captured
local mathenv = utils.mathenv

-- autosnippets
ls.add_snippets('tex', {
  s('//', fmta([[\frac{<>}{<>}]], {i(1), i(2)}), {condition=mathenv}),
  -- TODO - missing some fancy fractions

  s({trig='([^$%s]+)/', name='fancyfrac 1', regTrig=true},
    fmta([[\frac{<>}{<>}]], {f(captured,{}), i(1)}), {condition=mathenv}),

  s({trig='([^%s])sr', name='squared', regTrig=true, wordTrig=false},
    fmt([[{}^2]], {f(captured, {})}), {condition=mathenv}),

  s({trig='([^%s])cb', name='cubed', regTrig=true, wordTrig=false},
    fmt([[{}^3]], {f(captured, {})}), {condition=mathenv}),

  s({trig='([^%s])inv', name='inverse', regTrig=true, wordTrig=false},
    fmt([[{}^{{-1}}]], {f(captured, {})}), {condition=mathenv}),

  s({trig='([^%s])tp', name='transpose', regTrig=true, wordTrig=false},
    fmt([[{}^{{\top}}]], {f(captured, {})}), {condition=mathenv}),

  s({trig='([A-Za-df-z])(%d)', name='subscript', regTrig=true, wordTrig=false},
    fmt([[{}_{}]], {f(captured, {}, {user_args={1}}), f(captured, {}, {user_args={2}})}), {condition=mathenv}),

  s({trig='([%a])_(%d%d)', name='subscript2', regTrig=true, wordTrig=false},
    fmta([[<>_{<>}]], {f(captured, {}, {user_args={1}}), f(captured, {}, {user_args={2}})}), {condition=mathenv}),

  s({trig='([^%s])pw', name='power', regTrig=true, wordTrig=false},
    fmta([[<>^{<>}]], {f(captured, {}), i(1)}), {condition=mathenv}),

  s({trig='([+-]?)(%d+)(e?-?%d*)si', name='SI Unit After Integer', regTrig=true, priority=1000},
    fmta([[\SI{<><><>}{<>}]], {
      f(captured,{},{user_args={1}}),
      f(captured,{},{user_args={2}}),
      f(captured,{},{user_args={3}}),
      i(1)})),

  s({trig='([+-]?)(%d+[.]%d+)(e?-?%d*)si', name='SI Unit After Decimal', regTrig=true, priority=1001},
    fmta([[\SI{<><><>}{<>}]], {
      f(captured,{},{user_args={1}}),
      f(captured,{},{user_args={2}}),
      f(captured,{},{user_args={3}}),
      i(1)})),

  s({trig='=[%s]*([^=]+)bex', name='boxed until equals after', regTrig=true},
    fmta([[= \boxed{<>}]], {f(captured,{})})),

  s({trig='([%a])wt', name='wide tilde after', regTrig=true},
    fmta([[\widetilde{<>}]], {f(captured,{})}), {condition=mathenv}),

  s({trig='([%a])vec', name='vec after', regTrig=true},
    fmta([[\vec{<>}]], {f(captured,{})}), {condition=mathenv}),

  s({trig='([%a])bar', name='bar after', regTrig=true},
    fmta([[\overline{<>}]], {f(captured,{})}), {condition=mathenv}),

  s({trig='([%a])dot', name='dot after', regTrig=true},
    fmta([[\dot{<>}]], {f(captured,{})}), {condition=mathenv}),

  s({trig='([%a])hat', name='hat after', regTrig=true},
    fmta([[\hat{<>}]], {f(captured,{})}), {condition=mathenv}),


  -- quick environments
  s({trig='sqr', name='square root'},
    fmta([[\sqrt{<>}]], {i(1)}), {condition=mathenv}),

  s({trig='bb', name='mathbb'},
    fmta([[\mathbb{<>}]], {i(1)}), {condition=mathenv}),

  s({trig='wt', name='wide tilde'},
    fmta([[\widetilde{<>}]], {i(1)}), {condition=mathenv}),

  s({trig='vec', name='vector'},
    fmta([[\vec{<>}]], {i(1)}), {condition=mathenv}),

  s({trig='bar', name='bar'},
    fmta([[\overline{<>}]], {i(1)}), {condition=mathenv}),

  s({trig='dot', name='dot'},
    fmta([[\dot{<>}]], {i(1)}), {condition=mathenv}),

  s({trig='hat', name='hat'},
    fmta([[\hat{<>}]], {i(1)}), {condition=mathenv}),

  -- simple character replacements
  s({trig='ooo', name='infinity'}, t('\\infty'), {condition=mathenv}),
  s({trig='hhh', name='hbar'}, t('\\hbar'), {condition=mathenv}),
  s({trig='>>', name='much greater'}, t('\\gg '), {condition=mathenv}),
  s({trig='<<', name='much less'}, t('\\ll '), {condition=mathenv}),
  s({trig='=>', name='implies'}, t('\\implies '), {condition=mathenv}),
  s({trig='->', name='to'}, t('\\to '), {condition=mathenv}),
  s({trig='!>', name='maps to'}, t('\\mapsto '), {condition=mathenv}),
  s({trig='!=', name='not equals'}, t('\\neq '), {condition=mathenv}),
  s({trig='real', name='real'}, t('\\mathbb{R} '), {condition=mathenv}),
  s({trig='==', name='ampersand-equals'}, t('&= '), {condition=mathenv}),
  s({trig='apr', name='approximately'}, t('\\approx '), {condition=mathenv}),
  s({trig='eqv', name='equivalent'}, t('\\equivalent '), {condition=mathenv}),
}, {type = 'autosnippets'})

-- non-auto-snippets
ls.add_snippets('tex', {
  s({trig='(%d)e', name='times 10 power', regTrig=true, wordTrig=false},
    fmta([[<> \times 10^{<>}]], {f(captured, {}), i(1)}), {condition=mathenv}),

  -- quick environments
  s({trig='int', name='integral'},
    fmta([[\int_{<>}^{<>} {<>} \: d{<>}]], {i(1),i(2),i(3),i(4)}), {condition=mathenv}),

  s({trig='dif', name='differentiate'},
    fmta([[\frac{d<>}{d<>}]], {i(1,'y'), i(2,'x')}), {condition=mathenv}),

  s({trig='exp', name='natural exponent'},
    fmta([[\exp{<>}]], {i(1)}), {condition=mathenv}),

  s({trig='sin', name='sine'},
    fmta([[\sin{<>}]], {i(1)}), {condition=mathenv}),

  s({trig='cos', name='cosine'},
    fmta([[\cos{<>}]], {i(1)}), {condition=mathenv}),

  s({trig='tan', name='cosine'},
    fmta([[\cos{<>}]], {i(1)}), {condition=mathenv}),

  s({trig='asin', name='arcsin'},
    fmta([[\arcsin{<>}]], {i(1)}), {condition=mathenv}),

  s({trig='acos', name='arccos'},
    fmta([[\arccos{<>}]], {i(1)}), {condition=mathenv}),

  s({trig='atan', name='arctan'},
    fmta([[\arctan{<>}]], {i(1)}), {condition=mathenv}),

  s({trig='log', name='log'},
    fmta([[\log{<>}]], {i(1)}), {condition=mathenv}),

  s({trig='ln', name='ln'},
    fmta([[\ln{<>}]], {i(1)}), {condition=mathenv}),

  s({trig='pdif', name='partial differentiate'},
    fmta([[\frac{\partial <>}{\partial <>}]], {i(1,'y'), i(2,'x')}), {condition=mathenv}),

  s({trig='box', name='box'},
    fmt([[\box{{{}}}]], {i(1)}), {condition=mathenv}),

  s({trig='x', name='times'}, t('\\times '), {condition=mathenv}),
  s({trig='.', name='cdot'}, t('\\cdot '), {condition=mathenv}),
})

-- greek letters
ls.add_snippets('tex', {
  s({trig=';a', name='alpha', wordTrig=false}, t('\\alpha'), {condition=mathenv}),
  s({trig=';b', name='beta', wordTrig=false}, t('\\beta'), {condition=mathenv}),
  s({trig=';g', name='gamma', wordTrig=false}, t('\\gamma'), {condition=mathenv}),
  s({trig=';G', name='Gamma', wordTrig=false}, t('\\Gamma'), {condition=mathenv}),
  s({trig=';d', name='delta', wordTrig=false}, t('\\delta'), {condition=mathenv}),
  s({trig=';D', name='Delta', wordTrig=false}, t('\\Delta'), {condition=mathenv}),
  s({trig=';e', name='epsilon', wordTrig=false}, t('\\epsilon'), {condition=mathenv}),
  s({trig=';ve', name='varepsilon', wordTrig=false}, t('\\varepsilon'), {condition=mathenv}),
  s({trig=';z', name='zeta', wordTrig=false}, t('\\zeta'), {condition=mathenv}),
  s({trig=';h', name='eta', wordTrig=false}, t('\\eta'), {condition=mathenv}),
  s({trig=';q', name='theta', wordTrig=false}, t('\\theta'), {condition=mathenv}),
  s({trig=';Q', name='Theta', wordTrig=false}, t('\\Theta'), {condition=mathenv}),
  s({trig=';vq', name='vartheta', wordTrig=false}, t('\\vartheta'), {condition=mathenv}),
  s({trig=';i', name='iota', wordTrig=false}, t('\\iota'), {condition=mathenv}),
  s({trig=';k', name='kappa', wordTrig=false}, t('\\kappa'), {condition=mathenv}),
  s({trig=';l', name='lambda', wordTrig=false}, t('\\lambda'), {condition=mathenv}),
  s({trig=';L', name='Lambda', wordTrig=false}, t('\\Lambda'), {condition=mathenv}),
  s({trig=';m', name='mu', wordTrig=false}, t('\\mu'), {condition=mathenv}),
  s({trig=';n', name='nu', wordTrig=false}, t('\\nu'), {condition=mathenv}),
  s({trig=';c', name='xi', wordTrig=false}, t('\\xi'), {condition=mathenv}),
  s({trig=';C', name='Xi', wordTrig=false}, t('\\Xi'), {condition=mathenv}),
  s({trig=';p', name='pi', wordTrig=false}, t('\\pi'), {condition=mathenv}),
  s({trig=';P', name='Pi', wordTrig=false}, t('\\Pi'), {condition=mathenv}),
  s({trig=';r', name='rho', wordTrig=false}, t('\\rho'), {condition=mathenv}),
  s({trig=';vr', name='varrho', wordTrig=false}, t('\\varrho'), {condition=mathenv}),
  s({trig=';s', name='sigma', wordTrig=false}, t('\\sigma'), {condition=mathenv}),
  s({trig=';S', name='Sigma', wordTrig=false}, t('\\Sigma'), {condition=mathenv}),
  s({trig=';t', name='tau', wordTrig=false}, t('\\tau'), {condition=mathenv}),
  s({trig=';u', name='upsilon', wordTrig=false}, t('\\upsilon'), {condition=mathenv}),
  s({trig=';U', name='Upsilon', wordTrig=false}, t('\\Upsilon'), {condition=mathenv}),
  s({trig=';f', name='phi', wordTrig=false}, t('\\phi'), {condition=mathenv}),
  s({trig=';F', name='Phi', wordTrig=false}, t('\\Phi'), {condition=mathenv}),
  s({trig=';vf', name='varphi', wordTrig=false}, t('\\varphi'), {condition=mathenv}),
  s({trig=';x', name='chi', wordTrig=false}, t('\\chi'), {condition=mathenv}),
  s({trig=';y', name='psi', wordTrig=false}, t('\\psi'), {condition=mathenv}),
  s({trig=';Y', name='Psi', wordTrig=false}, t('\\Psi'), {condition=mathenv}),
  s({trig=';w', name='omega', wordTrig=false}, t('\\omega'), {condition=mathenv}),
  s({trig=';W', name='Omega', wordTrig=false}, t('\\Omega'), {condition=mathenv}),
}, {type = 'autosnippets'})
