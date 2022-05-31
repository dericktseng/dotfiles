local utils = require('sniputils')

return {
  s({trig='fref', name='figure reference'},
    fmta([[Figure \ref{fig:<>}]], i(1))
  ),

  s({trig='sref', name='section reference'},
    fmta([[Section \ref{sec:<>}]], i(1))
  ),

  s({trig='tref', name='table reference'},
    fmta([[Table \ref{tab:<>}]], i(1))
  ),

  s({trig='eref', name='equation reference'},
    fmta([[Eq \eqref{eq:<>}]], i(1))
  ),

  s({trig='\\\\', name='newline', wordtrig=false},
    t({'\\\\', ''})
  ),

  s({trig='...', name='ldots', wordtrig=false},
    t('\\ldots')
  ),

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

  s({trig='qt', name='Quotation'},
    fmta([[``<>'']], i(1))
  ),

  s({trig='mk', name='Math Inline'}, {
    t('$'), i(1), t('$'),
  }),

  s({trig='dm', name='Math Env'}, {
    t({'\\[', '\t'}),
    i(1),
    t({'', '.\\]'}),
  }),

  s({trig='si', name='siunitx'},
    fmta([[\SI{<>}{<>}]], {i(1), i(2)})
  ),

  s(
    {trig='sec', name='section'},
    fmta([[\section{<>}]], i(1))
  ),

  s(
    {trig='al', name='align environment'},
    fmta([[
      \begin{align*}
      <><>
      \end{align*}]],
      {t('\t'), i(1)}
    )
  ),

  s(
    {trig='ga', name='gather environment'},
    fmta([[
      \begin{gather*}
      <><>
      \end{gather*}]],
      {t('\t'), i(1)}
    )
  ),

  s(
    {trig='pict', name='insert picture top align'},
    fmta([[
      \begin{center}
      <>\adjustbox{valign=t}{\includegraphics[width=<>\textwidth]{<>}}
      \end{center}
      ]],
      {
        t('\t'),
        i(1,'0.9'),
        d(2, utils.filter_snippet, {}, {user_args = {{'png', 'jpg', 'jpeg'}}})
      }
    )
  ),

  s(
    {trig='code', name='insert code'},
    fmta(
      [[\lstinputlisting[language=<>,basicstyle=\footnotesize]<>]],
      {i(1, 'Python'), i(2)}
    )
  ),
  
  s(
    {trig='pdf', name='insert pdf'},
    fmta(
      [[\includepdf[pages=-,pagecommand={}, width=\textwidth]{<>}]],
      {d(1, utils.filter_snippet, {}, {user_args = {{'pdf'}}})}
    )
  ),

  s(
    {trig='conc', name='concentration'},
    fmta([[\ch{[<>]}]], {i(1)})
  ),

  s(
    {trig='ch', name='chemformula', wordtrig=false},
    fmta([[\ch{<>}]], {i(1)})
  ),

  s(
    {trig='bf', name='boldface'},
    fmta([[\textbf{<>}]], {i(1)})
  ),

  s(
    {trig='emp', name='emphasize'},
    fmta([[\emph{<>}]], {i(1)})
  ),

  s(
    {trig='it', name='italicize'},
    fmta([[\textit{<>}]], {i(1)})
  ),

  s(
    {trig='lb', name='label'},
    fmta([[\label{<>}]], {i(1)})
  ),

  s(
    {trig='cite', name='citation'},
    fmta([[\cite{<>}]], {i(1)})
  ),

  s(
    {trig='eq', name='equation'},
    fmta([[
      \begin{equation}
      <>\label{eq:<>}
      <><>
      \end{equation}
    ]], {t('\t'), i(1), t('\t'), i(2)})
  ),

  s(
    {trig='fig', name='Figure environment'},
    fmta([[
      \begin{figure}[htpb]
      <>\centering
      <>\includegraphics[width=0.9\textwidth]{<>}
      <>\caption{<>}
      <>\label{fig:<>}
      \end{figure}
    ]],
    {
      t('\t'),
      t('\t'),
      d(1, utils.filter_snippet, {}, {user_args = {{'png', 'jpg', 'jpeg'}}}),
      t('\t'),
      i(2),
      t('\t'),
      i(3)
    })
  ),

  -- TODO - functionNode to match number of & delimiters
  s(
    {trig='tb', name='Table environment'},
    fmta([[
      \begin{table}[htpb]
      <>\centering
      <>\begin{tabular}{<>}
      <><><>
      <>\end{tabular}
      <>\caption{<>}
      <>\label{tab:<>}
      \end{table}
    ]],
    {t('\t'), t('\t'), i(2), t('\t'), t('\t'), i(1), t('\t'), t('\t'), i(3), t('\t'), i(4)})
  ),

  s(
    {trig='beg', name='begin environment'},
    fmta([[
      \begin{<>}<>
      <><>
      \end{<>}
    ]],
    {i(1), i(2), t('\t'), i(3), rep(1)})
  ),

  s(
    {trig='setup', name='document setup'},
    fmta([[
          \documentclass[12pt]{article}

          %{{{ Packages 
          \usepackage[utf8]{inputenc}
          \usepackage[margin=1truein,letterpaper]{geometry}
          \usepackage[shortlabels]{enumitem}
          \usepackage{amsmath}
          \usepackage{amsfonts}
          \usepackage{amssymb}
          \usepackage{siunitx}
          \usepackage{graphicx}
          \usepackage{adjustbox}
          \usepackage{xurl}
          \usepackage{multicol}
          \usepackage{listings}
          \usepackage{chemformula}
          % \usepackage{pdfpages}

          \lstset{basicstyle=\ttfamily\footnotesize,breaklines=true,showstringspaces=false}
          %}}}

          % \setlength{\parindent}{0em}
          % \setlength{\parskip}{0.5em}

          \title{<>}
          \author{<>}
          \date{\today}

          \begin{document}
          <>\maketitle
          <><>
          \end{document}
    ]],
    {i(1, 'Title'), i(2, 'Derick Tseng'), t('\t'), t('\t'), i(3)})
  )
}
