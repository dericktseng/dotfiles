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

-- check if ultisnips can expand.
_G.UltiSnipsExpand = function()
    vim.fn["UltiSnips#ExpandSnippet"]()
    return vim.api.nvim_get_var("ulti_expand_res")
end

-- check if ultisnips can jump or expand.
_G.UltiSnipsNext = function()
    vim.fn["UltiSnips#ExpandSnippetOrJump"]()
    return vim.api.nvim_get_var("ulti_expand_or_jump_res")
end

-- check if ultisnips can jump back.
_G.UltiSnipsPrev = function()
    vim.fn["UltiSnips#JumpBackwards"]()
    return vim.api.nvim_get_var("ulti_jump_backwards_res")
end

-- tab completion for compe
_G.tab_complete = function()
    -- if popup visible and has a value selected, go down
    if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info()["selected"] ~= -1 then
        return t "<C-N>"
    -- if popup is visible, but no value selected, attempt snippet expand
    elseif vim.fn.pumvisible() ~= 0 then
        return t([[<C-R>=(v:lua.UltiSnipsExpand() > 0) ? "": ]]) .. [["\<C-N>"]] .. t("<CR>")
    elseif check_back_space() then
        return t "<Tab>"
    else
        return t([[<C-R>=(v:lua.UltiSnipsNext() > 0) ? "": ]]) .. [["\<TAB>"]] .. t("<CR>")
    end
end

-- s-tab completion for compe
_G.s_tab_complete = function()
    if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info()["selected"] ~= -1 then
        return t "<C-P>"
    -- if popup is visible, but no value selected, attempt snippet previous jump
    elseif vim.fn.pumvisible() ~= 0 then
        return t([[<C-R>=(v:lua.UltiSnipsPrev() > 0) ? "": ]]) .. [["\<C-P>"]] .. t("<CR>")
    else
        return t([[<C-R>=(v:lua.UltiSnipsPrev() > 0) ? "": ]]) .. [["\<S-TAB>"]] .. t("<CR>")
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
