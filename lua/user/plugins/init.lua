return {
    -- ["ggandor/leap.nvim"] = {
    --     config = function()
    --         require('leap').add_default_mappings()
    --     end,
    --     disable = true
    -- }
    {
        "joshdick/onedark.vim",
    },
    {
        "folke/zen-mode.nvim",
    },
    {
        "marko-cerovac/material.nvim",
        priority = 1000,
        config = function()
            require('material').setup({
                require('material').setup({

                    contrast = {
                        terminal = false, -- Enable contrast for the built-in terminal
                        sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
                        floating_windows = false, -- Enable contrast for floating windows
                        cursor_line = true, -- Enable darker background for the cursor line
                        non_current_windows = false, -- Enable darker background for non-current windows
                        filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
                    },

                    styles = { -- Give comments style such as bold, italic, underline etc.
                        comments = { italic = true },
                        strings = { bold = true },
                        keywords = { underline = true, italic = true },
                        functions = { --[[ bold = true, undercurl = true ]] undercurl = true },
                        variables = {},
                        operators = {},
                        types = {},
                    },

                    plugins = { -- Uncomment the plugins that you use to highlight them
                        -- Available plugins:
                        "dap",
                        "dashboard",
                        "gitsigns",
                        "hop",
                        "indent-blankline",
                        -- "lspsaga",
                        -- "mini",
                        -- "neogit",
                        "nvim-cmp",
                        -- "nvim-navic",
                        -- "nvim-tree",
                        "nvim-web-devicons",
                        -- "sneak",
                        "telescope",
                        "trouble",
                        "which-key",
                    },

                    disable = {
                        colored_cursor = false, -- Disable the colored cursor
                        borders = false, -- Disable borders between verticaly split windows
                        background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
                        term_colors = false, -- Prevent the theme from setting terminal colors
                        eob_lines = false -- Hide the end-of-buffer lines
                    },

                    high_visibility = {
                        lighter = false, -- Enable higher contrast text for lighter style
                        darker = true -- Enable higher contrast text for darker style
                    },

                    lualine_style = "stealth", -- Lualine style ( can be 'stealth' or 'default' )

                    async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)

                    custom_colors = nil, -- If you want to everride the default colors, set this to a function

                    custom_highlights = {}, -- Overwrite highlights with your own
                })
            })
        end
    },
    {
        "folke/tokyonight.nvim",
    },
    {
        'nvim-treesitter/playground',
    },
    {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require('todo-comments').setup {
                signs = true, -- show icons in the signs column
                sign_priority = 8, -- sign priority
            }
        end
    },
    {
        "RRethy/nvim-treesitter-textsubjects",
        config = function()
            require('nvim-treesitter.configs').setup {
                textsubjects = {
                    enable = true,
                    prev_selection = ',', -- (Optional) keymap to select the previous selection
                    keymaps = {
                        ['.'] = 'textsubjects-smart',
                        [';'] = 'textsubjects-container-outer',
                        ['i;'] = 'textsubjects-container-inner',
                    },
                },
            }
        end
    },
    {
        "folke/twilight.nvim",
        config = function()
            require("twilight").setup {
                {
                    dimming = {
                        alpha = 0.25, -- amount of dimming
                        -- we try to get the foreground from the highlight groups or fallback color
                        color = { "Normal", "#ffffff" },
                        term_bg = "#000000", -- if guibg=NONE, this will be used to calculate text color
                        inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
                    },
                    context = 10, -- amount of lines we will try to show around the current line
                    treesitter = true, -- use treesitter when available for the filetype
                    -- treesitter is used to automatically expand the visible text,
                    -- but you can further control the types of nodes that should always be fully expanded
                    expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
                        "function",
                        "method",
                        "table",
                        "if_statement",
                        "for_statement",
                        "dictionary_comprehension",
                        "function_definition",
                        "decorated_definition",
                    },
                    exclude = {}, -- exclude these filetypes
                }

            }
        end
    },
    {
        'romgrk/nvim-treesitter-context',
        config = function()
            require('treesitter-context').setup { enable = true }
        end
    },
    {
        "phaazon/hop.nvim",
        config = function()
            require("hop").setup()
        end
    },
    ["ray-x/lsp_signature.nvim"] = {
        event = "BufRead",
        config = function()
            require("lsp_signature").setup()
        end,
    },
    {
        "RishabhRD/nvim-cheat.sh",
        requires = "RishabhRD/popfix",
        as = 'nvim-cheat',
        config = function()
            vim.g.cheat_default_window_layout = "float"
        end,
        opt = true,
        cmd = { "Cheat", "CheatWithoutComments", "CheatList", "CheatListWithoutComments" },
        -- keys = "<leader>?",
    },
    { 'mattn/emmet-vim' },
    { 'https://github.com/preservim/tagbar' },
    { 'bps/vim-textobj-python' },
    { 'kana/vim-textobj-user' },
    { 'tpope/vim-surround' },
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                auto_open = true,
                auto_close = true,
                padding = true,
                height = 10,
                use_diagnostic_signs = true,
            }
        end,
        cmd = "TroubleToggle",
    },
    {
        'wthollingsworth/pomodoro.nvim',
        requires = 'MunifTanjim/nui.nvim',
        config = function()
            require('pomodoro').setup({
                time_work = 25,
                time_break_short = 5,
                time_break_long = 20,
                timers_to_long_break = 4
            })
        end
    },
    {
        "nathom/filetype.nvim"
    },
}
