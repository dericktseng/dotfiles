-- module to export
local fn = {}

-- check back spaces
local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- run through checking ultisnips viability. Returns fallthrough if fails
local trigger_ultisnips_fwd = function(fallthrough)
    if vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
        return fn.t([[<C-R>=UltiSnips#ExpandSnippet()<CR>]])
    elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
        return fn.t([[<C-R>=UltiSnips#JumpForwards()<CR>]])
    else
        return fallthrough
    end
end

-- run through s-tab options too
local trigger_ultisnips_bak = function(fallthrough)
    if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
        return fn.t([[<C-R>=UltiSnips#JumpBackwards()<CR>]])
    else
        return fallthrough
    end
end


-- EXPORTED FUNCTIONS
-- escape termcodes properly
fn.t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end


-- tab completion for compe
fn.complete_or_next = function(trigger, fallthrough)
    -- if popup visible and has a value selected, go down
    if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info()["selected"] ~= -1 then
        return fallthrough
    -- if popup is visible, but no value selected, attempt snippet expand
    elseif vim.fn.pumvisible() ~= 0 then
        return trigger_ultisnips_fwd(fallthrough)
    elseif check_back_space() then
        return trigger
    else
        return trigger_ultisnips_fwd(trigger)
    end
end

-- s-tab completion for compe
fn.complete_or_back = function(trigger, fallthrough)
    if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info()["selected"] ~= -1 then
        return fallthrough
    -- if popup is visible, but no value selected, attempt snippet previous jump
    elseif vim.fn.pumvisible() ~= 0 then
        return trigger_ultisnips_bak(fallthrough)
    else
        return trigger_ultisnips_bak(trigger)
    end
end

-- quick keymap with default noremap
fn.keymap = function(mode, lhs, rhs, opts)
    options = { noremap = true, silent = true }
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- smart nav for mapping k -> gk or j -> gj
fn.smart_nav = function(key)
    return vim.v.count == 0 and 'g' .. key or key
end

-- check for pumvisible completions
fn.pumvisible_complete = function(dirkey, key)
    return vim.fn.pumvisible() ~= 0 and fn.t(dirkey) or fn.t(key)
end

-- display syntax group names
fn.syntax_group = function()
    local curr = vim.fn.synID(vim.fn.line('.'), vim.fn.col('.'), 1)
    local orig = vim.fn.synIDattr(curr, 'name')
    local after = vim.fn.synIDattr(vim.fn.synIDtrans(curr), 'name')
    print(orig .. ' -> ' .. after)
end

-- populates location list with lsp diagnostics
fn.lsplocationlist = function()
	vim.lsp.diagnostic.set_loclist({open_loclist = false})
end

-- toggle quickfixlist or locationlist
fn.togglelist = function(listtypeletter)
	-- for some reason, v:val.loclist is always 0, so list will always be empty.
	if vim.fn.empty(vim.fn.filter(vim.fn.getwininfo(), 'v:val.quickfix')) == 1 then
		vim.api.nvim_command(listtypeletter .. 'open')
    else
		vim.api.nvim_command('lclose')
		vim.api.nvim_command('cclose')
	end
end

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


-- exporting global functions
_G.completion_confirm = fn.completion_confirm
_G.smart_nav = fn.smart_nav
_G.p_complete = fn.pumvisible_complete
_G.syntax_group = fn.syntax_group
_G.lsplocationlist = fn.lsplocationlist
_G.togglelist = fn.togglelist
_G.tablinestr = fn.tablinestr


return fn
