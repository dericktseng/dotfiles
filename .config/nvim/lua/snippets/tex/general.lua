local ls = require'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

ls.add_snippets('tex', {
  s({trig='fref', name='figure reference'}, {
    t('Figure \\ref{fig:'), i(1), t('}')
  }),

  s({trig='sref', name='section reference'}, {
    t('Figure \\ref{sec:'), i(1), t('}')
  }),

  s({trig='tref', name='table reference'}, {
    t('Table \\ref{tab:'), i(1), t('}')
  }),

  s({trig='eref', name='equation reference'}, {
    t('Eq \\eqref{eq:'), i(1), t('}')
  }),

  s({trig='\\\\', name='newline', wordtrig=false}, {
    t({'\\\\', ''}),
  }),

  s({trig='...', name='ldots', wordtrig=false}, {
    t({'\\ldots'}),
  }),

  s({trig='enuma', name='enumerate (a)'}, {
    t({'\\begin{enumerate}[(a)]', '\t'}),
    t('\\item '), i(1),
    t({'', '\\end{enumerate}'})
  }),

  s({trig='enumi', name='enumerate (i)'}, {
    t({'\\begin{enumerate}[(i)]', '\t'}),
    t('\\item '), i(1),
    t({'', '\\end{enumerate}'})
  }),

  s({trig='enum1', name='enumerate (1)'}, {
    t({'\\begin{enumerate}[(1)]', '\t'}),
    t('\\item '), i(1),
    t({'', '\\end{enumerate}'})
  }),

  s({trig='qt', name='Quotation'}, {
    t('``'), i(1), t('\'\''),
  }),

  s({trig='mk', name='Math Inline'}, {
    t('$'), i(1), t('$'),
  }),

  s({trig='dm', name='Math Env'}, {
    t({'\\[', '\t'}),
    i(1),
    t({'', '.\\]'}),
  }),

  s({trig='si', name='siunitx'}, {
    t('\\SI{'), i(1), t('}{'), i(2), t('}')
  }),

  s(
    {trig='sec', name='section'},
    fmt([[\section{{{1}}}]], i(1))
  ),

  s(
    {trig='al', name='align environment'},
    fmt([[
      \begin{{align*}}
          {}
      \end{{align*}}]],
      {i(1)}
    )
  ),

  s(
    {trig='ga', name='gather environment'},
    fmt([[
      \begin{{gather*}}
          {}
      \end{{gather*}}]],
      {i(1)}
    )
  ),

  s(
    {trig='pict', name='insert picture top align'},
    fmt([[
      \begin{{center}}
          \adjustbox{{valign=t}}{{\includegraphics[width={1}\textwidth]{{{2}}}}}
      \end{{center}}
      ]],
      {i(1, '0.7'), i(2)}
    )
  ),

  s(
    {trig='code', name='insert code'},
    fmt(
      [[\lstinputlisting[language={1},basicstyle=\footnotesize]{2}]],
      {i(1, 'Python'), i(2)}
    )
  ),
  
  s(
    {trig='pdf', name='insert pdf'},
    fmt(
      [[\includepdf[pages=-,pagecommand={{}}, width=\textwidth]{{{}.pdf}} ]],
      {i(1)}
    )
  ),

  s(
    {trig='conc', name='concentration'},
    fmt([[\ch{{[{}]}}]], {i(1)})
  ),

  s(
    {trig='ch', name='chemformula', wordtrig=false},
    fmt([[\ch{{{}}}]], {i(1)})
  ),

  s(
    {trig='bf', name='boldface'},
    fmt([[\textbf{{{}}}]], {i(1)})
  ),

  s(
    {trig='emp', name='emphasize'},
    fmt([[\emph{{{}}}]], {i(1)})
  ),

  s(
    {trig='it', name='italicize'},
    fmt([[\textit{{{}}}]], {i(1)})
  ),

  s(
    {trig='lb', name='label'},
    fmt([[\label{{{}}}]], {i(1)})
  ),

  s(
    {trig='cite', name='citation'},
    fmt([[\cite{{{}}}]], {i(1)})
  ),

  s(
    {trig='eq', name='equation'},
    fmt([[
      \begin{{equation}}
          \label{{eq:{}}}
          {}
      \end{{equation}}
    ]], {i(1), i(2)})
  ),

  s(
    {trig='fig', name='Figure environment'},
    fmt([[
      \begin{{figure}}[htpb]
          \centering
          \includegraphics[width=0.9\textwidth]{{{1}}}
          \caption{{{2}}}
          \label{{fig:{3}}}
      \end{{figure}}
    ]],
    {i(1), i(2), i(3)})
  ),

  s(
    {trig='tab', name='Table environment'},
    fmt([[
      \begin{{table}}[htpb]
          \centering
          \begin{{tabular}}{{}}
              {1}
          \end{{tabular}}{{}}
          \caption{{{2}}}
          \label{{tab:{3}}}
      \end{{table}}
    ]],
    {i(1), i(2), i(3)})
  ),

  s(
    {trig='beg', name='begin environment'},
    fmt([[
      \begin{{{1}}}{2}
          {}
      \end{{{}}}
    ]],
    {i(1), i(2), i(3), rep(1)})
  ),

  s(
    {trig='setup', name='document setup'},
    fmt([[
          \documentclass[12pt]{{article}}

          %{{{{{{ Packages 
          \usepackage[utf8]{{inputenc}}
          \usepackage[margin=1truein,letterpaper]{{geometry}}
          \usepackage[shortlabels]{{enumitem}}
          \usepackage{{amsmath}}
          \usepackage{{amsfonts}}
          \usepackage{{amssymb}}
          \usepackage{{siunitx}}
          \usepackage{{graphicx}}
          \usepackage{{adjustbox}}
          \usepackage{{xurl}}
          \usepackage{{multicol}}
          \usepackage{{listings}}
          \usepackage{{chemformula}}
          % \usepackage{{pdfpages}}

          \lstset{{basicstyle=\ttfamily\footnotesize,breaklines=true,showstringspaces=false}}
          %}}}}}}

          % \setlength{{\parindent}}{{0em}}
          % \setlength{{\parskip}}{{0.5em}}

          \title{{{1}}}
          \author{{{2}}}
          \date{{\today}}

          \begin{{document}}
              \maketitle
              {3}
          \end{{document}}
    ]],
    {i(1, 'Title'), i(2, 'Derick Tseng'), i(3)})
  )
})
