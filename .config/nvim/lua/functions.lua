-- module to export
local fn = {}

-- EXPORTED FUNCTIONS
-- escape termcodes properly
fn.press = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- check if has words before
fn.has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- general wrapper function to wrap around function with arguments
fn.fnwrap = function(fn, args)
  return function() return fn(args) end
end

-- smart nav for mapping k -> gk or j -> gj
fn.smart_nav = function(key)
  local count = vim.v.count
  local gnav = count == 0 and 'g' .. key or key
  if count >= 5 then
    gnav = [[m']] .. count .. gnav
  end
  return gnav
end

-- function wrapper for navigating up
fn.nav_up = function()
  return fn.smart_nav('k')
end

-- function wrapper for navigating down
fn.nav_down = function()
  return fn.smart_nav('j')
end

-- ignore copy to clipboard for empty lines
fn.smart_dd = function()
  if vim.api.nvim_get_current_line():match("^%s*$") then
    return "\"_dd"
  else
    return "dd"
  end
end

-- tabline configurations
fn.tablinestr = function()
  local line = ''
  local tabcount = vim.fn.tabpagenr('$')
  local modifyindicator = '●'
  local emptybuffer = '[No Name]'
  local numberdelimiter = ' '
  local padding = ' '
  local tabdelimiter = '▎'
  local closeicon = '%999X+'

  for i = 1, tabcount do
    local winnr = vim.fn.tabpagewinnr(i)
    local buflist = vim.fn.tabpagebuflist(i)
    local bufnr = buflist[winnr]
    local bufname = vim.fn.bufname(bufnr)
    local bufmodified = vim.fn.getbufvar(bufnr, '&mod')

    local filename = vim.fn.fnamemodify(bufname, ':t')
    local fileExt = vim.fn.fnamemodify(bufname, ':e')

    line = line .. '%' .. i .. 'T'

    -- index and tab delimiter
    if i == vim.fn.tabpagenr() then
      line = line .. '%#TabLineSel#' .. tabdelimiter .. i .. numberdelimiter
    else
      line = line .. '%#Tabline#' .. tabdelimiter .. i .. numberdelimiter
    end

    if icon then
      line = line .. icon .. padding
    end

    -- filename
    if bufname == '' then
      line = line .. emptybuffer
    else
      line = line .. filename
    end

    -- modify indicator and close icon
    if bufmodified == 1 and bufname ~= '' then
      line = line .. ' ' .. modifyindicator .. ' ' .. closeicon
    else
      line = line .. '  ' .. closeicon
    end

    -- padding
    line = line .. padding
  end

  line = line .. '%#TabLine#' .. tabdelimiter
  line = line .. '%#TabLineFill#%T'
  return line
end

-- Telescope functions
fn.project_files = function()
  local opts = {} -- define here if you want to define something
  local ok = pcall(require'telescope.builtin'.git_files, opts)
  if not ok then require'telescope.builtin'.find_files(opts) end
end

fn.vimrc = function()
  require'telescope.builtin'.find_files({
    prompt_title = "vimrc",
    cwd = "$HOME/.config/nvim/"
  })
end

fn.local_diagnostics = function()
  require'telescope.builtin'.diagnostics({
    bufnr = 0,
  })
end

-- global vim variables
_G.tablinestr = fn.tablinestr

return fn
