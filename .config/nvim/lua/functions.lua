-- module to export
local fn = {}

-- EXPORTED FUNCTIONS
-- escape termcodes properly
fn.press = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end


-- quick keymap with default noremap
fn.keymap = function(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- smart nav for mapping k -> gk or j -> gj
fn.smart_nav = function(key)
  local count = vim.v.count
  local gnav = count == 0 and 'g' .. key or key
  if count >= 5 then
    gnav = [[m']] .. count .. gnav
  end
  return fn.press(gnav)
end

-- populates location list with lsp diagnostics
fn.lsplocationlist = function()
  vim.lsp.diagnostic.set_loclist({open_loclist = false})
end

-- tabline configurations
fn.tablinestr = function()
  local line = ''
  local tabcount = vim.fn.tabpagenr('$')
  local modifyindicator = '●'
  local emptybuffer = '[No Name]'
  local numberdelimiter = ' '
  local padding = ' '
  local tabdelimiter = '▎ '
  local closeicon = '%999X'

  for i = 1, tabcount do
    local winnr = vim.fn.tabpagewinnr(i)
    local buflist = vim.fn.tabpagebuflist(i)
    local bufnr = buflist[winnr]
    local bufname = vim.fn.bufname(bufnr)
    local bufmodified = vim.fn.getbufvar(bufnr, '&mod')

    line = line .. '%' .. i .. 'T'

    -- index and tab delimiter
    if i == vim.fn.tabpagenr() then
      line = line .. '%#TabLineDelimSel#' .. tabdelimiter
      line = line .. '%#TabLineNrSel#' ..  i .. numberdelimiter
      line = line .. '%#TabLineSel#'
    else
      line = line .. '%#TabLineDelim#' .. tabdelimiter
      line = line .. '%#TabLineNr#' ..  i .. numberdelimiter
      line = line .. '%#TabLine#'
    end

    -- filename
    if bufname == '' then
      line = line .. emptybuffer
    else
      line = line .. vim.fn.fnamemodify(bufname, ':t')
    end

    -- modify indicator and close icon
    if bufmodified == 1 then
      line = line .. ' ' .. modifyindicator .. ' ' .. closeicon
    else
      line = line .. '  ' .. closeicon
    end

    -- padding
    line = line .. padding
  end

  line = line .. '%#TabLineDelim#' .. tabdelimiter
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

-- global vim variables
_G.tablinestr = fn.tablinestr
_G.smart_nav = fn.smart_nav
_G.project_files = fn.project_files
_G.vimrc = fn.vimrc
_G.lsplocationlist = fn.lsplocationlist

return fn
