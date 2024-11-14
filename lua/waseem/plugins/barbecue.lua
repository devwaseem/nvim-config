return {
    "utilyre/barbecue.nvim",
    enabled = false,
    event = { "BufReadPost" },
    name = "barbecue",
    version = "*",
    dependencies = {
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
        symbols = {
            separator = "/",
        }
    },
}
