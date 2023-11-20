local M = {}

local map_generator = function(mode)
    local map = function(keys, expr, desc)
        if type(keys) == "table" then
            for _, value in ipairs(keys) do
                vim.keymap.set(mode, value, expr, {
                    desc = desc,
                    noremap = true,
                    silent = false
                })
            end
        else
            vim.keymap.set('n', keys, expr, {
                desc = desc,
                noremap = true,
                silent = false
            })
        end
    end
    return map
end

M.nmap = map_generator('n')
M.vmap = map_generator('v')
M.xmap = map_generator('x')
M.tmap = map_generator('t')

return M
