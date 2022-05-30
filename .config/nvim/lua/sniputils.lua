local ls = require'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

-- Common utility functions used to write luasnippets
local utils = {}

-- closes environment opened by character c:
-- "" '' {} <> []
utils.close_env = function(c)
  local table = {
    ["'"] = "'",
    ['"'] = '"',
    ['{'] = '}',
    ['<'] = '>',
    ['['] = ']',
  }

  return table[c]
end

-- wrapper function to return the "closing character" for the inputted argument.
utils.close_func = function(args, snips, user_arg)
  return utils.close_env(args[1][1])
end

-- determines whether we are in a math environment (requires vimtex)
utils.mathenv = function(line_to_cursor, matched_trigger, captures)
  return vim.call('vimtex#syntax#in_mathzone') == 1
end

-- returns the captured text from regex node at the specified
-- user_args position (1st by default)
utils.captured = function(args, snip, user_args)
  return snip.captures[user_args or 1]
end

-- filters specified directory for certain filetypes
-- returns file handle to iterate over the files that were filtered by their filetypes
-- WARNING: MUST CLOSE THE FILE HANDLE AFTER READING FROM IT
-- requires the 'fd' binary
-- filetypes: the table of filetype extensions (without the leading .)
utils.filter_dir = function(filetypes)
  -- constructs the extension string for fd (-e ext1 -e ext2 ...)
  extension_str = ''
  for _, ext in pairs(filetypes) do
    extension_str = extension_str .. ' -e ' .. ext
  end

  local handle = assert(io.popen('fd -t f' .. extension_str))
  return handle
end

-- returns snippetnode containing a choicenode to cycle between files in the
-- current working directory of given filetypes
-- filetypes: the table of filetype extensions (without the leading .)
utils.filter_snippet = function(args, parent, old_state, filetypes)
  local handle = utils.filter_dir(filetypes)
  local node_files = {}
  for file in handle:lines() do
    table.insert(node_files, t(file))
  end

  -- closes the handle
  handle:close()

  -- insert final insert node for manual input
  table.insert(node_files, i(1, 'file'))
  return sn(nil, c(1, node_files))
end

return utils
