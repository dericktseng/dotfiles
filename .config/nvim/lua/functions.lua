-- escape termcodes properly
local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

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
        return t([[<C-R>=UltiSnips#ExpandSnippet()<CR>]])
    elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
        return t([[<C-R>=UltiSnips#JumpForwards()<CR>]])
    else
        return t(fallthrough)
    end
end

-- run through s-tab options too
local trigger_ultisnips_bak = function(fallthrough)
    if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
        return t([[<C-R>=UltiSnips#JumpBackwards()<CR>]])
    else
        return t(fallthrough)
    end
end

-- tab completion for compe
_G.tab_complete = function()
    -- if popup visible and has a value selected, go down
    if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info()["selected"] ~= -1 then
        return t("<C-N>")
    -- if popup is visible, but no value selected, attempt snippet expand
    elseif vim.fn.pumvisible() ~= 0 then
        return trigger_ultisnips_fwd("<C-N>")
    elseif check_back_space() then
        return t("<TAB>")
    else
        return trigger_ultisnips_fwd("<TAB>")
    end
end

-- s-tab completion for compe
_G.s_tab_complete = function()
    if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info()["selected"] ~= -1 then
        return t("<C-P>")
    -- if popup is visible, but no value selected, attempt snippet previous jump
    elseif vim.fn.pumvisible() ~= 0 then
        return trigger_ultisnips_bak("<C-P>")
    else
        return trigger_ultisnips_bak("<S-TAB>")
    end
end

-- enter completion for autopairs and compe
local npairs = require('nvim-autopairs')
_G.completion_confirm = function()
    if vim.fn.pumvisible() ~= 0  then
        if vim.fn.complete_info()["selected"] ~= -1 then
            return vim.fn["compe#confirm"](npairs.esc("<cr>"))
        else
            return npairs.esc("<cr>")
        end
    else
        return npairs.autopairs_cr()
    end
end
