return {
    "eandrju/cellular-automaton.nvim",
    enabled = true,
    cmd = { "CellularAutomaton" },
    keys = {
        { "<leader>ux",  desc = "CellularAutomaton" },
        { "<leader>uxr", "<cmd>CellularAutomaton make_it_rain<CR>", desc = "Make it rain" },
        { "<leader>uxg", "<cmd>CellularAutomaton game_of_life<CR>", desc = "Game of life" },
        { "<leader>uxs", "<cmd>CellularAutomaton scramble<CR>",     desc = "Scramble" },
    }
}
