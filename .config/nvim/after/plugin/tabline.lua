-- tabline configurations
function _G.tablinestr()
  local line = ''
  local tabcount = vim.fn.tabpagenr('$')
  local modifyindicator = '●'
  local emptybuffer = '[No Name]'
  local numberdelimiter = ' '
  local padding = ' '
  local tabdelimiter = '▎'
  local closeicon = '%999XX'

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
    local tabtype = (i == vim.fn.tabpagenr()) and '%#TabLineSel#' or '%#Tabline#'
    line = line .. tabtype .. tabdelimiter .. i .. numberdelimiter

    -- filename
    local title = (bufname == '') and emptybuffer or filename
    line = line .. title

    -- modify indicator and close icon
    local modifiedstr = (bufmodified == 1 and bufname ~= '') and modifyindicator or ''
    line = line .. ' ' .. modifiedstr .. ' ' .. closeicon

    -- padding
    line = line .. padding
  end

  line = line .. '%#TabLine#' .. tabdelimiter
  line = line .. '%#TabLineFill#%T'
  return line
end

vim.o.tabline = '%!v:lua.tablinestr()'
