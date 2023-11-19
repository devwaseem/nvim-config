return {
    'numToStr/Comment.nvim',
    opts = {
        -- add any options here
    },
    lazy = false,
    keys = {
        {"<leader>/", "<cmd>execute 'normal gcc'<CR>", mode="v"},
        {"<leader>/", "<cmd>execute 'normal gcc'<CR>", mode="n"}
    }
}
