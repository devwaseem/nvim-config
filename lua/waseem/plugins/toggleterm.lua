return {
    'akinsho/toggleterm.nvim',
    version = "*",
    event = "VeryLazy",
    keys = {
        { "<leader>tf", "<cmd>ToggleTerm direction=float<CR>",      "Toggle Terminal as Float" },
        { "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>",   "Toggle Terminal in Vertical Split" },
        { "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", "Toggle Terminal in Horizontal Split" },
        { "<C-\\>",     "<cmd>ToggleTerm direction=horizontal<CR>", "Toggle Terminal in Horizontal Split" },

    },
    config = function()
        require('toggleterm').setup({
            open_mapping = [[<C-\>]],
            direction = "float",
            highlights = {
                Normal = {
                    guibg = require('material.colors').editor.contrast
                }
            },
            float_opts = {
                border = "single",
            }
        })
    end
}
