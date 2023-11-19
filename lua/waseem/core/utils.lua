local M = {}

M.nmap = function(keys, expr, desc)
    if type(keys) == "table" then
        for _, value in ipairs(keys) do
            vim.keymap.set('n', value, expr, {
                desc=desc,
                noremap=true,
                silent=false
            })
        end
    else
        vim.keymap.set('n', keys, expr, {
            desc = desc,
            noremap = true,
            silent=false
        })
    end
end

return M
