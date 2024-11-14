return {
    {
        "tiagovla/tokyodark.nvim",
        priority = 1000,
        enabled = true,
        opts = {},
        config = function(_, opts)
            require("tokyodark").setup(opts) -- calling setup is optional
        end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        enabled = false,
    },
    {
        "marko-cerovac/material.nvim",
        priority = 1000,
        config = function()
            vim.g.material_style = "deep ocean"
            require('material').setup({
                contrast = {
                    terminal = true,             -- Enable contrast for the built-in terminal
                    sidebars = false,            -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
                    floating_windows = false,    -- Enable contrast for floating windows
                    cursor_line = false,         -- Enable darker background for the cursor line
                    non_current_windows = false, -- Enable contrasted background for non-current windows
                    filetypes = {},              -- Specify which filetypes get the contrasted (darker) background
                },

                styles = { -- Give comments style such as bold, italic, underline etc.
                    comments = { italic = true --[[ italic = true ]] },
                    strings = { --[[ bold = true ]] },
                    keywords = { italic = true, bold = false --[[ underline = true ]] },
                    functions = { undercurl = false --[[ bold = true, undercurl = true ]] },
                    variables = { bold = false },
                    operators = { italic = true },
                    types = { italic = true },
                },

                plugins = { -- Uncomment the plugins that you use to highlight them
                    -- Available plugins:
                    -- "dap",
                    -- "dashboard",
                    -- "eyeliner",
                    "fidget",
                    "flash",
                    "gitsigns",
                    "harpoon",
                    -- "hop",
                    "illuminate",
                    "indent-blankline",
                    -- "lspsaga",
                    "mini",
                    -- "neogit",
                    "neotest",
                    "neorg",
                    "noice",
                    "nvim-cmp",
                    -- "nvim-navic",
                    -- "nvim-tree",
                    "nvim-web-devicons",
                    -- "rainbow-delimiters",
                    -- "sneak",
                    "telescope",
                    "trouble",
                    "which-key",
                },
                custom_colors = function(colors)
                    colors.editor.accent = colors.main.darkyellow
                end
            })
        end,
    },
    {
        "ayu-theme/ayu-vim",
        priority = 1000,
        enabled = false,
        config = function()
            vim.g.ayucolor = "dark"
        end,
    },
    {
        "nyoom-engineering/oxocarbon.nvim",
        priority = 1000,
        enabled = false,
        config = function()
            vim.opt.background = "dark"
        end
    },
}
