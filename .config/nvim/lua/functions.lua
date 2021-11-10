local devicons = require('nvim-web-devicons')

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

-- quickfix or loclist
fn.togglelist = function(list_type)
  local vfn = vim.fn
  local cmdopen
  local cmdclose
  local tabnr = vfn.tabpagenr()
  local haslist

  if list_type == 'quickfix' then
    cmdopen = 'copen'
    cmdclose = 'cclose'
  else
    cmdopen = 'lopen'
    cmdclose = 'lclose'
  end

  for _, v in ipairs(vfn.getwininfo()) do
    haslist = (v[list_type] == 1)
    if tabnr == v['tabnr'] and haslist then
      return cmdclose
    end
  end

  return cmdopen
end

-- converts diagnostics to list
fn.diagnostics_to_list = function(buffernum, diagnostic)
  local uri = vim.uri_from_bufnr(buffernum)
  local severitymap = {'E', 'W', 'I', 'H'}

  local listitems = {}
  for _, v in ipairs(diagnostic) do
    local item = {
      bufnr = buffernum,
      filename = vim.uri_to_fname(uri),
      text = v.message,
      lnum = v.range.start.line + 1,
      col = v.range.start.character + 1,
      type = severitymap[v.severity]
    }

    table.insert(listitems, item)
  end

  return listitems
end

-- sends diagnostics to quickfix
fn.diag_to_quickfix = function()
  if vim.lsp.buf.server_ready() then
    local fulldiagnostics = vim.lsp.diagnostic.get_all(nil)

    local full_list = {}
    for bufnr, diagnostic in ipairs(fulldiagnostics) do
      local bufferlist = fn.diagnostics_to_list(bufnr, diagnostic)
      table.merge(full_list, bufferlist)
    end

    vim.lsp.util.set_qflist(full_list)
  end
end

-- sends diagnostics to loclist
fn.diag_to_loclist = function()
  if vim.lsp.buf.server_ready() then
    local bufnr = vim.fn.bufnr()
    local diagnostic = vim.lsp.diagnostic.get(bufnr)
    local list = fn.diagnostics_to_list(bufnr, diagnostic)
    vim.lsp.util.set_loclist(list)
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
  local closeicon = '%999X'

  for i = 1, tabcount do
    local winnr = vim.fn.tabpagewinnr(i)
    local buflist = vim.fn.tabpagebuflist(i)
    local bufnr = buflist[winnr]
    local bufname = vim.fn.bufname(bufnr)
    local bufmodified = vim.fn.getbufvar(bufnr, '&mod')

    local filename = vim.fn.fnamemodify(bufname, ':t')
    local fileExt = vim.fn.fnamemodify(bufname, ':e')
    local icon = devicons.get_icon(filename, fileExt)

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

-- global vim variables
_G.tablinestr = fn.tablinestr
_G.smart_nav = fn.smart_nav
_G.project_files = fn.project_files
_G.vimrc = fn.vimrc
_G.togglelist = fn.togglelist
_G.diag_to_loclist = fn.diag_to_loclist
_G.diag_to_quickfix = fn.diag_to_quickfix

return fn
