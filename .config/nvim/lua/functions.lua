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
fn.fnwrap = function(f, args)
  return function() return f(args) end
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

-- creates an autocmd that outputs stdout/stderr into a buffer.
fn.register_autorun_cmd = function(cmd, pattern, bufnr)
  vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('autorun', {clear = true}),
    pattern = pattern,
    callback = function()
      -- interior function.
      local append_data = function(_, data)
        if data then
          vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
        end
      end

      vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, {'=== OUTPUT ==='})
      vim.fn.jobstart(vim.split(cmd, ' '), {
        stdout_buffered = true,
        stderr_buffered = true,
        on_stdout = append_data,
        on_stderr = append_data,
      })
    end
   })
end

-- wrapper around the previous autocmd
fn.autorun_cmd = function(cmd)
  local ext = vim.fn.expand('%:e')
  local pattern = '*.' .. ext

  -- creates new buffer to house the output
  vim.cmd('vsplit')
  local bufnr = vim.api.nvim_create_buf(true, true)
  local win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_buf(win, bufnr)
  fn.register_autorun_cmd(cmd, pattern, bufnr)
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

return fn
