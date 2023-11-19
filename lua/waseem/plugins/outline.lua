return {
    "hedyhli/outline.nvim",
    cmd = "Outline",
    keys = {
        { "<leader>ls", "<cmd>Outline<CR>", desc = "Toggle Outline" },
    },
    config = function()
        require("outline").setup {}
    end,
}
