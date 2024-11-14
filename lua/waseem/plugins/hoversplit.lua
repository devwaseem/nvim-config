return {
    "roobert/hoversplit.nvim",
    keys = {
        "<leader>ks", "<leader>kv",
        "<leader>kS", "<leader>kV",
    },
    config = function()
        require("hoversplit").setup({
            key_bindings = {
                split_remain_focused = "<leader>ks",
                vsplit_remain_focused = "<leader>kv",
                split = "<leader>kS",
                vsplit = "<leader>kV",
            },
        })
    end,
}
