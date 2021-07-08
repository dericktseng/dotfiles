-- Remove all existing highlighting and set the defaults.
-- vim.api.nvim_command('hi clear')

-- terminal colors
vim.g.terminal_color_0  = '#dff4ff'
vim.g.terminal_color_1  = '#ff8671'
vim.g.terminal_color_2  = '#14a57c'
vim.g.terminal_color_3  = '#499ec8'
vim.g.terminal_color_4  = '#59b6ea'
vim.g.terminal_color_5  = '#ee22bc'
vim.g.terminal_color_6  = '#8f5eba'
vim.g.terminal_color_7  = '#4a545b'
vim.g.terminal_color_8  = '#97a5ab'
vim.g.terminal_color_9  = '#ff8671'
vim.g.terminal_color_10 = '#14a57c'
vim.g.terminal_color_11 = '#499ec8'
vim.g.terminal_color_12 = '#59b6ea'
vim.g.terminal_color_13 = '#ee22bc'
vim.g.terminal_color_14 = '#8f5eba'
vim.g.terminal_color_15 = '#4a545b'

-- local variables colors to insert into the highlighting function
local white = '#eeeeee'
local offwhite = '#dedede'
local darkred = '#af0000'
local turquoise = '#00a979'
local green = '#008700'
local lightgreen = '#46d211'
local darkgreen = '#006200'
local teal = '#4badb9'
local darkgrey = '#878787'
local lightblue = '#03b9d5'
local black = '#222222'
local grey = '#bcbcbc'
local lightgrey = '#d3d3d3'
local red = '#ff0000'
local purple = '#a300f4'
local darkblue = '#005faf'
local orange = '#f2802d'
local yelloworange = '#daa500'
local yellow = '#ffc900'
local highlightyellow='#fff641'
local blue = '#0787a9'
local purpleblue = '#4078f2'
local indigo = '#002ba9'
local pink = '#f400f4'
local skyblue = '#adf1f1'
local brown = '#883f16'

-- formatting styles
local bold='bold'
local italic='italic'
local underline='underline'
local undercurl='undercurl'
local none='NONE'

-- highlighting function. AT LEAST ONE OF fg, bg, attr, attrsp MUST NOT BE NIL
local highlightfunc = function(group, fg, bg, attr, attrsp)
    local foreground = fg and ' guifg=' .. fg or ''
    local background = bg and ' guibg=' .. bg or ''
    local style = attr and ' gui=' .. attr or ''
    local stylesp = attrsp and ' guisp=' .. attrsp or ''
    vim.api.nvim_command('highlight ' .. group .. foreground .. background .. style .. stylesp)
end

local linkfunc = function(group1, group2)
    vim.api.nvim_command('highlight link ' .. group1 .. ' ' .. group2)
end

-- builtin highlight groups according to help: highlight-groups
highlightfunc('ColorColumn', nil, darkgrey, nil, nil)
highlightfunc('Conceal', purpleblue, none, nil, nil)
highlightfunc('Cursor', white, black, nil, nil)
highlightfunc('CursorColumn', nil, darkgrey, nil, nil)
highlightfunc('CursorLine', nil, white, none, nil)
highlightfunc('Directory', darkblue, nil, nil, nil)

-- Diff
highlightfunc('DiffAdded', green, nil, bold, nil)
highlightfunc('DiffRemoved', darkred, nil, bold, nil)
highlightfunc('DiffAdd', green, nil, nil, nil)
highlightfunc('DiffChange', blue, nil, nil, nil)
highlightfunc('DiffDelete', darkred, nil, nil, nil)
highlightfunc('DiffText', purpleblue, nil, nil, nil)

highlightfunc('EndOfBuffer', black, nil, nil, nil)
highlightfunc('ErrorMsg', darkred, white, nil, nil)
highlightfunc('VertSplit', white, black, nil, nil)
highlightfunc('Folded', darkgrey, lightgrey, italic, nil)
highlightfunc('FoldColumn', purpleblue, white, nil, nil)
highlightfunc('SignColumn', nil, white, nil, nil)
highlightfunc('IncSearch', black, yellow, none, nil)
highlightfunc('Substitute', nil, skyblue, none, nil)
highlightfunc('LineNr', darkgrey, nil , nil, nil)
highlightfunc('CursorLineNr', yelloworange, white, nil, nil)
highlightfunc('MatchParen', nil, lightgrey, nil, nil)
highlightfunc('ModeMsg', green, nil, nil, nil)
highlightfunc('MoreMsg', green, nil, nil, nil)
highlightfunc('NonText', grey, nil, none, nil)
highlightfunc('Normal', black, nil , nil, nil)
highlightfunc('NormalFloat', nil, white, nil, nil)
highlightfunc('NormalNC', nil, none, nil, nil)

-- PMenu
highlightfunc('Pmenu', nil, offwhite, nil, nil)
highlightfunc('PmenuSel', black, skyblue, nil, nil)
highlightfunc('PmenuSbar', nil, darkgrey, nil, nil)
highlightfunc('PmenuThumb', nil, lightblue, nil, nil)

highlightfunc('Question', purpleblue, nil, nil, nil)
highlightfunc('Search', nil, highlightyellow, nil, nil)
highlightfunc('SpecialKey', green, nil, nil, nil)

-- SpellCheck colors
highlightfunc('SpellBad', nil, nil, undercurl, red)
highlightfunc('SpellLocal', nil, nil, undercurl, turquoise)
highlightfunc('SpellCap', nil, nil, undercurl, blue)
highlightfunc('SpellRare', nil, nil, undercurl, teal)

-- StatusLine
highlightfunc('StatusLine', blue, offwhite, nil, nil)
highlightfunc('StatusLineNC', black, offwhite, nil, nil)

-- Tabline
highlightfunc('TabLine', indigo, offwhite, none, nil)
highlightfunc('TabLineFill', none, none, none, nil)
highlightfunc('TabLineSel', white, darkblue, none, nil)

highlightfunc('Title', purpleblue, nil, nil, nil)
highlightfunc('Visual', black, skyblue, nil, nil)
highlightfunc('VisualNOS', darkred, nil, nil, nil)
highlightfunc('WarningMsg', darkred, white, nil, nil)
highlightfunc('WildMenu', black, purpleblue, nil, nil)

linkfunc('Menu', 'Normal')
linkfunc('Scrollbar', 'PmenuSbar')
highlightfunc('Tooltip', indigo, skyblue, nil, nil)

highlightfunc('Bold', nil, nil, bold, nil)
highlightfunc('Italic', nil, nil, italic, nil)

-- Help Menu
highlightfunc('helpExample', orange, nil, nil, nil)
highlightfunc('helpCommand', orange, nil, nil, nil)

-- Syntax Group as according to help: group-name
highlightfunc('Comment', darkgrey, nil, italic, nil)

highlightfunc('Constant', green, nil, bold, nil)
highlightfunc('String', green, nil, nil, nil)
highlightfunc('Character', blue, nil, nil, nil)
highlightfunc('Number', orange, nil, nil, nil)
highlightfunc('Boolean', green, nil, bold, nil)
highlightfunc('Float', brown, nil, nil, nil)

highlightfunc('Identifier', lightblue, nil, nil, nil)
highlightfunc('Function', purpleblue, nil, nil, nil)

highlightfunc('Statement', purple, nil, none, nil)
highlightfunc('Conditional', pink, nil, bold, nil)
highlightfunc('Repeat', brown, nil, bold, nil)
highlightfunc('Label', pink, nil, bold, nil)
highlightfunc('Operator', indigo, nil, nil, nil)
highlightfunc('Keyword', darkred, nil, bold, nil)
highlightfunc('Exception', brown, nil, bold, nil)

highlightfunc('PreProc', darkblue, nil, nil, nil)
highlightfunc('Include', purpleblue, nil, nil, nil)
highlightfunc('Define', pink, nil, nil, nil)
highlightfunc('Macro', purple, nil, nil, nil)
highlightfunc('PreCondit', darkred, nil, nil, nil)

highlightfunc('Type', indigo, nil, none, nil)
highlightfunc('StorageClass', darkblue, nil, nil, nil)
highlightfunc('Structure', darkblue, nil, bold, nil)
highlightfunc('Typedef', indigo, nil, bold, nil)

highlightfunc('Special', darkblue, nil, nil, nil)
highlightfunc('SpecialChar', darkgrey, nil, nil, nil)
highlightfunc('Tag', nil, yelloworange, nil, nil)
highlightfunc('Delimiter', teal, nil, nil, nil)
highlightfunc('SpecialComment', blue, nil, nil, nil)
highlightfunc('Debug', darkred, nil, nil, nil)

highlightfunc('Underlined', darkblue, nil, nil, nil)
highlightfunc('Error', red, white, bold, nil)
highlightfunc('Todo', green, white, bold, nil)

-- from help: lsp-highlight
highlightfunc('LspDiagnosticsDefaultError', red, nil, nil, nil)
highlightfunc('LspDiagnosticsDefaultWarning', orange, nil, nil, nil)
highlightfunc('LspDiagnosticsDefaultInformation', darkblue, nil, nil, nil)
highlightfunc('LspDiagnosticsDefaultHint', purpleblue, nil, nil, nil)

highlightfunc('LspDiagnosticsVirtualTextError', red, nil, nil, nil)
highlightfunc('LspDiagnosticsVirtualTextWarning', orange, nil, nil, nil)
highlightfunc('LspDiagnosticsVirtualTextInformation', darkblue, nil, nil, nil)
highlightfunc('LspDiagnosticsVirtualTextHint', purpleblue, nil, nil, nil)

highlightfunc('LspDiagnosticsSignError', darkred, nil, nil, nil)
highlightfunc('LspDiagnosticsSignWarning', orange, nil, nil, nil)
highlightfunc('LspDiagnosticsSignInformation', purpleblue, nil, nil, nil)
highlightfunc('LspDiagnosticsSignHint', blue, nil, nil, nil)

highlightfunc('LspDiagnosticsUnderlineError', nil, nil, undercurl, red)
highlightfunc('LspDiagnosticsUnderlineWarning', nil, nil, undercurl, orange)
highlightfunc('LspDiagnosticsUnderlineInformation', nil, nil, undercurl, darkblue)
highlightfunc('LspDiagnosticsUnderlineHint', nil, nil, undercurl, purpleblue)


-- other links
linkfunc('shQuote', 'String')
linkfunc('vimScriptDelim', 'Macro')
linkfunc('StringDelimiter', 'String')
linkfunc('CompeDocumentation', 'NormalFloat')
