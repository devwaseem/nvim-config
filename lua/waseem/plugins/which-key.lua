return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = "<space>",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    opts = {
        icons = {
            group = "+ ",
        },
    },
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)
        wk.register {
            ["<leader>f"] = { name = " Find" },
            ["<leader>l"] = { name = " LSP" },
            ["<leader>u"] = { name = " UI" },
            ["<leader>g"] = { name = " Goto" },
            ["<leader>e"] = { name = " Explorer" },
        }
    end,
}
