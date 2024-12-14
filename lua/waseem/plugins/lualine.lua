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

        local custom_theme = nil
        if vim.g.colors_name == 'material' and pcall(require, 'material') then
            local mcolors = require('material.colors')
            local m = mcolors.main
            local e = mcolors.editor
            custom_theme = {
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
        end

        local options = {
            component_separators = { left = '›', right = '‹' },
            section_separators = { right = '' },
        }

        if custom_theme then
            options.theme = custom_theme
        end

        require('lualine').setup {
            options = options,
            sections = {
                lualine_a = {
                    -- { 'mode' }
                    {
                        require("noice").api.status.mode.get,
                        cond = require("noice").api.status.mode.has,
                        separator = { left = '', right = '' },
                        -- right_padding = 2
                    },

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
                },
                lualine_x = {
                    -- {
                    --     require("noice").api.status.command.get,
                    --     cond = require("noice").api.status.command.has,
                    -- },
                    {
                        function()
                            return "Supermaven"
                        end,
                        icon = "󱡄",
                        cond = require('supermaven-nvim.api').is_running,
                    },
                    {
                        function()
                            local clients = vim.lsp.get_active_clients({ bufnr = 0 })
                            if next(clients) == nil then
                                return '' -- No LSP attached
                            end
                            local lsp_names = {}
                            for _, client in pairs(clients) do
                                table.insert(lsp_names, client.name)
                            end
                            return table.concat(lsp_names, ', ')
                        end,
                        icon = '', -- Optional icon
                    },
                    {
                        require("noice").api.status.search.get,
                        cond = require("noice").api.status.search.has,
                    },
                    { 'encoding' },
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
