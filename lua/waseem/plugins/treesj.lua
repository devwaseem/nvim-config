return {
    'Wansmer/treesj',
    keys = {
        { "J", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
    },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
        require('treesj').setup({
            use_default_keymaps = false,
        })
    end,
}
