" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "customlight"

" vim: sw=2
let s:white = '#eeeeee'
let s:darkred = '#af0000'
let s:turquoise = '#00a979'
let s:green = '#008700'
let s:lightgreen = '#46d211'
let s:darkgreen = '#006200'
let s:teal = '#4badb9'
let s:darkgrey = '#878787'
let s:lightblue = '#03b9d5'
let s:black = '#222222'
let s:grey = '#bcbcbc'
let s:lightgrey = '#d3d3d3'
let s:red = '#d70000'
let s:purple = '#a300f4'
let s:darkblue = '#005faf'
let s:orange = '#ea8a00'
let s:yelloworange = '#daa500'
let s:yellow = '#ffc900'
let s:highlightyellow='#fff641'
let s:blue = '#0787a9'
let s:purpleblue = '#4078f2'
let s:indigo = '#0c1986'
let s:pink = '#f400f4'
let s:skyblue = '#a0dee8'
let s:brown = '#883f16'

" terminal colors
let g:terminal_color_0  = '#dff4ff'
let g:terminal_color_1  = '#ff8671'
let g:terminal_color_2  = '#14a57c'
let g:terminal_color_3  = '#499ec8'
let g:terminal_color_4  = '#59b6ea'
let g:terminal_color_5  = '#ee22bc'
let g:terminal_color_6  = '#8f5eba'
let g:terminal_color_7  = '#4a545b'
let g:terminal_color_8  = '#97a5ab'
let g:terminal_color_9  = '#ff8671'
let g:terminal_color_10 = '#14a57c'
let g:terminal_color_11 = '#499ec8'
let g:terminal_color_12 = '#59b6ea'
let g:terminal_color_13 = '#ee22bc'
let g:terminal_color_14 = '#8f5eba'
let g:terminal_color_15 = '#4a545b'

let s:bold='bold'
let s:italic='italic'
let s:none='NONE'
let s:undercurl='undercurl'
let s:underline='underline'

" {{{ highlight function
function! <sid>hi(group, fg, bg, attr, attrsp)
  " fg, bg, attr, attrsp
  if !empty(a:fg)
    exec "hi " . a:group . " guifg=" .  a:fg
  endif
  if !empty(a:bg)
    exec "hi " . a:group . " guibg=" .  a:bg
  endif
  if !empty(a:attr)
    exec "hi " . a:group . " gui=" .   a:attr
  endif
  if !empty(a:attrsp)
    exec "hi " . a:group . " guisp=" . a:attrsp
  endif
endfunction
"}}}


" {{{ builtin highlight groups according to help: highlight-groups
  call s:hi('ColorColumn', '', s:darkgrey, '', '')
  call s:hi('Conceal', s:purpleblue, s:white, '', '')
  call s:hi('Cursor', s:white, s:black, '', '')
  call s:hi('CursorColumn', '', s:darkgrey, '', '')
  call s:hi('CursorLine', '', s:white, s:none, '')
  call s:hi('Directory', s:darkblue, '', '', '')

  " Diff
  call s:hi('DiffAdded', s:green, '', s:bold, '')
  call s:hi('DiffRemoved', s:darkred, '', s:bold, '')
  call s:hi('DiffAdd', s:green, '', '', '')
  call s:hi('DiffChange', s:blue, '', '', '')
  call s:hi('DiffDelete', s:darkred, '', '', '')
  call s:hi('DiffText', s:purpleblue, '', '', '')

  call s:hi('EndOfBuffer', s:black, '', '', '')
  call s:hi('ErrorMsg', s:darkred, s:white, '', '')
  call s:hi('VertSplit', s:white, s:black, '', '')
  call s:hi('Folded', s:darkgrey, s:lightgrey, s:italic, '')
  call s:hi('FoldColumn', s:purpleblue, s:white, '', '')
  call s:hi('SignColumn', '', s:white, '', '')
  call s:hi('IncSearch', s:black, s:yellow, s:none, '')
  call s:hi('Substitute', '', s:skyblue, s:none, '')
  call s:hi('LineNr', s:darkgrey, '' , '', '')
  call s:hi('CursorLineNr', s:yelloworange, s:white, '', '')
  call s:hi('MatchParen', '', s:lightgrey, '', '')
  call s:hi('ModeMsg', s:green, '', '', '')
  call s:hi('MoreMsg', s:green, '', '', '')
  call s:hi('NonText', s:grey, '', s:none, '')
  call s:hi('Normal', s:black, '' , '', '')
  hi link NormalFloat Normal
  hi link NormalNC Normal

  " PMenu
  call s:hi('PMenu', '', s:lightgrey, '', '')
  call s:hi('PMenuSel', s:black, s:lightblue, '', '')
  call s:hi('PmenuSbar', '', s:darkgrey, '', '')
  call s:hi('PmenuThumb', '', s:lightblue, '', '')

  call s:hi('Question', s:purpleblue, '', '', '')
  call s:hi('Search', '', s:highlightyellow, '', '')
  call s:hi('SpecialKey', s:green, '', '', '')

  " SpellCheck colors
  call s:hi('SpellBad', '', '', s:undercurl, s:red)
  call s:hi('SpellLocal', '', '', s:undercurl, s:turquoise)
  call s:hi('SpellCap', '', '', s:undercurl, s:blue)
  call s:hi('SpellRare', '', '', s:undercurl, s:teal)

  " StatusLine
  call s:hi('StatusLine', s:darkred, s:green, '', '')
  call s:hi('StatusLineNC', s:black, s:darkred, '', '')

  " Tabline
  call s:hi('TabLine', s:green, s:darkred, '', '')
  call s:hi('TabLineFill', s:green, s:darkred, '', '')
  call s:hi('TabLineSel', s:green, s:darkred, '', '')

  call s:hi('Title', s:purpleblue, '', '', '')
  call s:hi('Visual', s:black, s:skyblue, '', '')
  call s:hi('VisualNOS', s:darkred, '', '', '')
  call s:hi('WarningMsg', s:darkred, s:white, '', '')
  call s:hi('WildMenu', s:black, s:purpleblue, '', '')

  hi link Menu Normal
  hi link Scrollbar PmenuSbar
  call s:hi('Tooltip', s:indigo, s:skyblue, '', '')

  call s:hi('Bold', '', '', s:bold, '')
  call s:hi('Italic', '', '', s:italic, '')
 
  " Help Menu
  call s:hi('helpExample', s:orange, '', '', '')
  call s:hi('helpCommand', s:orange, '', '', '')

  " Syntax Group as according to help: group-name
  call s:hi('Comment', s:darkgrey, '', s:italic, '')

  call s:hi('Constant', s:green, '', s:bold, '')
  call s:hi('String', s:green, '', '', '')
  call s:hi('Character', s:orange, '', '', '')
  call s:hi('Number', s:darkblue, '', '', '')
  call s:hi('Boolean', s:green, '', s:bold, '')
  call s:hi('Float', s:teal, '', '', '')

  call s:hi('Identifier', s:lightblue, '', '', '')
  call s:hi('Function', s:purpleblue, '', '', '')

  call s:hi('Statement', s:purple, '', s:none, '')
  call s:hi('Conditional', s:pink, '', s:bold, '')
  call s:hi('Repeat', s:brown, '', s:bold, '')
  call s:hi('Label', s:pink, '', '', '')
  call s:hi('Operator', s:indigo, '', '', '')
  call s:hi('Keyword', s:purple, '', '', '')
  call s:hi('Exception', s:darkred, '', '', '')

  call s:hi('PreProc', s:darkblue, '', '', '')
  call s:hi('Include', s:purpleblue, '', '', '')
  call s:hi('Define', s:purple, '', '', '')
  call s:hi('Macro', s:turquoise, '', '', '')
  call s:hi('PreCondit', s:pink, '', '', '')

  call s:hi('Type', s:indigo, '', s:none, '')
  call s:hi('StorageClass', s:darkblue, '', '', '')
  call s:hi('Structure', s:darkblue, '', s:bold, '')
  call s:hi('Typedef', s:indigo, '', s:bold, '')

  call s:hi('Special', s:darkblue, '', '', '')
  call s:hi('SpecialChar', s:brown, '', '', '')
  call s:hi('Tag', '', s:yelloworange, '', '')
  call s:hi('Delimiter', s:teal, '', '', '')
  call s:hi('SpecialComment', s:blue, '', '', '')
  call s:hi('Debug', s:darkred, '', '', '')

  call s:hi('Underlined', s:darkblue, '', '', '')
  call s:hi('Error', s:red, s:white, s:none, '')
  call s:hi('Todo', s:green, s:white, s:bold, '')

   " LSP
  call s:hi('LspDiagnosticsDefaultError', s:red, '', '', '')
  call s:hi('LspDiagnosticsSignError', s:darkred, '', '', '')
  call s:hi('LspDiagnosticsUnderlineError', '', '', s:undercurl, s:red)
 
  call s:hi('LspDiagnosticsDefaultWarning', s:orange, '', '', '')
  call s:hi('LspDiagnosticsSignWarning', s:orange, '', '', '')
  call s:hi('LspDiagnosticsUnderlineWarning', '', '', s:undercurl, s:orange)
 
  call s:hi('LspDiagnosticsDefaultInformation', '', '', '', '')
  call s:hi('LspDiagnosticsSignInformation', s:purpleblue, '', '', '')
  call s:hi('LspDiagnosticsUnderlineInformation', '', '', s:undercurl, '')
 
  call s:hi('LspDiagnosticsDefaultHint', '', '', '', '')
  call s:hi('LspDiagnosticsSignHint', s:blue, '', '', '')
  call s:hi('LspDiagnosticsUnderlineHint', '', '', s:undercurl, '')

  " Other links
  hi link shQuote String
  hi link vimScriptDelim Macro
  hi link StringDelimiter String
" }}}
