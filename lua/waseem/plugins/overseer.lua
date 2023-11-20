return {
    'stevearc/overseer.nvim',
    keys = {
        { "<leader>rt", "<cmd>OverseerToggle<cr>" },
        { "<leader>rr", "<cmd>OverseerRun<cr>" }
    },
    opts = {},
    config = function(_, opts)
        require('overseer').setup(opts)
    end
}
