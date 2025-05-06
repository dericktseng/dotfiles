local utils = require('sniputils')
local ls = require('luasnip')
local extras = require("luasnip.extras")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local fmta = require("luasnip.extras.fmt").fmta
local rep = extras.rep
-- local isn = ls.indent_snippet_node

-- needs to end with / (e.g. $HOME/Documents/LatexClasses/)
local latex_class_dir = "$HOME/Documents/LatexClasses/"

-- copies the latex file specified in active choice
-- of choice node into current directory.
local function copy_latex_class_callback(choice_node)
  local active_choice = choice_node.active_choice
  local filename = active_choice.static_text[1]
  local file = latex_class_dir .. filename .. '.cls'

  os.execute('cp ' .. file .. ' ./')
end

return {
  s({trig='verb', name='verbatim'},
    fmta([[\verb|<>|]], i(1))
  ),

  s({trig='ref', name='cleveref reference'},
    fmta([[\cref{<>}]], i(1))
  ),

  s({trig='Ref', name='cleveref reference capital'},
    fmta([[\Cref{<>}]], i(1))
  ),

  s({trig='\\\\', name='newline', wordtrig=false},
    t({'\\\\', ''})
  ),

  s({trig='...', name='ldots', wordtrig=false},
    t('\\ldots')
  ),

  s({trig='item', name='itemize'}, {
    t({'\\begin{itemize}', '\t'}),
    t('\\item '), i(1),
    t({'', '\\end{itemize}'})
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

  s({trig='    itm', name='item'}, {t({'\\item '})}),

  s({trig='qt', name='Quotation'},
    fmta([[``<>'']], i(1))
  ),

  s({trig='mk', name='Math Inline'}, {
    t('$'), i(1), t('$'),
  }),

  s({trig='dm', name='Math Env'}, {
    t({'\\[', '\t'}),
    i(1),
    t({'', '\\]'}),
  }),

  s({trig='si', name='siunitx'},
    fmta([[$\SI{<>}{<>}$]], {i(1), i(2)})
  ),

  s({trig='np', name='newpage'}, t([[\newpage]])),

  s({trig='cp', name='clearpage'}, t([[\clearpage]])),

  s({trig='chp', name='chapter'}, fmta([[\chapter{<>}]], i(1))),

  s({trig='bib', name='bibliography'}, t([[\printbibliography]])),

  s(
    {trig='(s*)sec', name='section', regTrig=true},
    fmta([[\<>section{<>}]], {
      f(function(args, snip)
        return snip.captures[1]:gsub('s', 'sub');
      end),
      i(1),
  })),

  s(
    {trig='(s*)secl', name='section', regTrig=true},
    fmta([[\<>section{<>} \label{sec:<>}]], {
      f(function(args, snip)
        return snip.captures[1]:gsub('s', 'sub');
      end),
      i(1),
      extras.rep(1)
  })),

  s(
    {trig='al', name='align environment'},
    fmta([[
      \begin{align*}
      <><>
      \end{align*}
      ]],
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
    {trig='svg', name='Figure environment'},
    fmta([[
      \begin{figure}[htpb]
      <>\centering
      <>\includesvg[inkscapelatex=false,width=0.7\textwidth]{<>}
      <>\caption{<>}
      <>\label{fig:<>}
      \end{figure}
    ]],
    {
      t('\t'),
      t('\t'),
      d(1, utils.filter_snippet, {}, {user_args = {{'svg'}}}),
      t('\t'),
      i(2),
      t('\t'),
      i(3)
    })
  ),

  s(
    {trig='pict', name='insert picture top align'},
    fmta([[
      \begin{center}
      <>\includegraphics[width=<>\textwidth]{<>}
      \end{center}
      ]],
      {
        t('\t'),
        i(1,''),
        d(2, utils.filter_snippet, {}, {user_args = {{'png', 'jpg', 'jpeg'}}})
      }
    )
  ),

  s(
    {trig='code', name='insert code'},
    fmta(
      [[\lstinputlisting[language=<>]{<>}]],
      {i(1, 'Python'), i(2)}
    )
  ),

  s(
    {trig='pdf', name='insert pdf'},
    fmta(
      [[\includepdf[pages=-,pagecommand={}]{<>}]],
      {d(1, utils.filter_snippet, {}, {user_args = {{'pdf'}}})}
    )
  ),

  s(
    {trig='inc', name='include tex'},
    fmta(
      [[\include{<>}]],
      {d(1, utils.filter_snippet, {}, {user_args = {{'tex'}}})}
    )
  ),

  s(
    {trig='conc', name='concentration'},
    fmta([[\ce{[<>]}]], {i(1)})
  ),

  s(
    {trig='ce', name='mhchem', wordtrig=false},
    fmta([[$\ce{<>}$]], {i(1)})
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
    {trig='eqn', name='equation', wordtrig=true},
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
      <>\includegraphics[width=0.7\textwidth]{<>}
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

  s(
    {trig='sfig', name='subfigures'},
    fmta([[
      \begin{figure}[htpb]
      <>\centering
      <>\begin{subfigure}[t]{0.49\textwidth}
      <><>\includegraphics[width=\textwidth]{<>}
      <><>\caption{<>}
      <><>\label{fig:<>}
      <>\end{subfigure}
      <>\caption{<>}
      <>\label{fig:<>}
      \end{figure}
    ]], {
      t('\t'),
      t('\t'),
      t('\t'), t('\t'), d(1, utils.filter_snippet, {}, {user_args={{'png', 'jpg', 'jpeg'}}}),
      t('\t'), t('\t'), i(2),
      t('\t'), t('\t'), i(3),
      t('\t'),
      t('\t'), i(4),
      t('\t'), i(5)
    })
  ),

  -- TODO - functionNode to match number of & delimiters
  s(
    {trig='tb', name='Table environment'},
    fmta([[
      \begin{table}[htpb]
      <>\centering
      <>\begin{tabularx}{\textwidth}{<>}
      <><>\toprule
      <><><>
      <><>\midrule
      <><>\bottomrule
      <>\end{tabularx}
      <>\caption{<>}
      <>\label{tab:<>}
      \end{table}
    ]],
    {
      t('\t'),
      t('\t'), i(2),
      t('\t'), t('\t'),
      t('\t'), t('\t'), i(1),
      t('\t'), t('\t'),
      t('\t'), t('\t'),
      t('\t'),
      t('\t'), i(3),
      t('\t'), i(4)
    })
  ),

  s(
    {trig='theorem', name='theorem environment'},
    fmta([[
      \begin{theorem}<>
      <><>
      \end{theorem}
    ]],
    {i(1), t('\t'), i(2)})
  ),

  s(
    {trig='proof', name='proof environment'},
    fmta([[
      \begin{proof}
      <><>
      \end{proof}
    ]],
    {t('\t'), i(1)})
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
          \documentclass{<>}
          \title{<>}
          \date{\today}
          \author{Derick Tseng}

          \begin{document}
          <>\maketitle
          <><>
          \end{document}
    ]],
    {
      d(1, utils.filter_snippet, {}, {
          user_args = {{'cls'}, latex_class_dir, utils.trim_file_ext, copy_latex_class_callback},
      }),
      i(2, 'Title'), t('\t'), t('\t'), i(3)
    })
  )
}
