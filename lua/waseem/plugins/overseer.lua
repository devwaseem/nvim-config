return {
    'stevearc/overseer.nvim',
    enabled = false,
    keys = {
        { "<leader>rt", "<cmd>OverseerToggle<cr>" },
        { "<leader>rr", "<cmd>OverseerRun<cr>" }
    },
    opts = {},
    config = function(_, opts)
        require('overseer').setup(opts)
    end
}
