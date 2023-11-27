return {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        "marko-cerovac/material.nvim",
    },
    config = function()
        local colors = {
            blue   = '#80a0ff',
            cyan   = '#79dac8',
            black  = '#080808',
            white  = '#c6c6c6',
            red    = '#ff5189',
            violet = '#d183e8',
            grey   = '#303030',
        }

        local mcolors = require('material.colors')
        local m = mcolors.main
        local e = mcolors.editor
        local s = mcolors.syntax

        local bubbles_theme = {
            normal = {
                a = { fg = e.fg, bg = e.bg, gui = "bold" },
                b = { fg = m.gray, bg = e.bg, gui = "italic" },
                c = { fg = m.gray, bg = e.bg, gui = "italic" },

                z = { fg = m.gray, bg = e.bg, gui = "bold" },

            },
            insert = {
                a = { fg = m.black, bg = m.darkgreen, gui = "bold" },
                b = { fg = m.gray, bg = e.bg, gui = "italic" },
                c = { fg = m.gray, bg = e.bg, gui = "italic" },

                z = { fg = m.darkgreen, bg = e.bg, gui = "bold" },
            },
            visual = {
                a = { fg = m.black, bg = m.darkred, gui = "bold" },
                b = { fg = m.gray, bg = e.bg, gui = "italic" },
                c = { fg = m.gray, bg = e.bg, gui = "italic" },

                z = { fg = m.darkred, bg = e.bg, gui = "bold" },
            },
            replace = {
                a = { fg = m.black, bg = m.paleblue, gui = "bold" },
                b = { fg = m.gray, bg = e.bg, gui = "italic" },
                c = { fg = m.gray, bg = e.bg, gui = "italic" },

                z = { fg = m.paleblue, bg = e.bg, gui = "bold" },
            },

            inactive = {
                a = { fg = colors.white, bg = e.bg },
                b = { fg = colors.white, bg = e.bg },
                c = { fg = colors.black, bg = e.bg },
            },
        }

        require('lualine').setup {
            options = {
                theme = bubbles_theme,
                component_separators = '›',
                section_separators = { right = '󱎕' },
            },
            sections = {
                lualine_a = {
                    { 'mode' }
                },
                lualine_b = {
                    { 'filename' },
                    { 'branch' },
                    { 'diff' },
                },
                lualine_c = {
                    { 'diagnostics' },
                    { 'searchcount' },
                    { 'selectioncount' },
                    { "overseer" },
                    -- { require("dr-lsp").lspCount },
                    -- { require("dr-lsp").lspProgress },
                },
                lualine_x = {
                    { 'encoding' }
                },
                lualine_y = {
                    { 'progress' }
                },
                lualine_z = {
                    { 'location', icon = "" }
                },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
            extensions = {},
        }
    end
}
