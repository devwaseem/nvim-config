return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    keys = {
        { "<leader>o",  "<cmd>Neotree toggle=true source=filesystem reveal=true position=bottom<CR>", desc = "Open Filesystem Explorer as float" },
        { "<leader>ef", "<cmd>Neotree toggle=true source=filesystem reveal=true position=left<CR>",   desc = "Open Filesystem Explorer to the left" },
        { "<leader>eb", "<cmd>Neotree toggle=true source=buffers position=float<CR>",                 desc = "Open Buffer explorer as float" }
    },
    config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        require('neo-tree').setup({
            close_if_last_window = true,
            event_handlers = {
                {
                    event = "file_opened",
                    handler = function(file_path)
                        require("neo-tree.command").execute({ action = "close" })
                    end
                },
            },
            filesystem = {
                window = {
                    mappings = {
                        ["o"] = "system_open",
                    },
                },
                commands = {
                    system_open = function(state)
                        local node = state.tree:get_node()
                        local path = node:get_id()
                        -- macOs: open file in default application in the background.
                        vim.fn.jobstart({ "open", "-g", path }, { detach = true })
                    end,
                },
            },
        })
    end,
}
