local M = {}

M.get_waseem_ivy_theme = function()
    return require('telescope.themes').get_ivy {
        prompt_prefix = "Ⲗ "
        -- prompt_prefix = " "

    }
end

return M
