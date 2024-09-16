return {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPost",
    enabled = true,
    opts = {
        indent = {
            char = "│",
            tab_char = "│",
        },
        scope = { enabled = true },
        exclude = {
            filetypes = {
                "help",
                "alpha",
                "dashboard",
                "neo-tree",
                "Starter",
                "Trouble",
                "trouble",
                "lazy",
                "mason",
                "notify",
                "toggleterm",
            },
        },
    },
    main = "ibl",
}
