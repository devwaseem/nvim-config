return {
    'stevearc/conform.nvim',
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
    },
    keys = {
        -- Toggle
        { "<leader>ufd", "<cmd>:FormatDisable<CR>", desc = "Disable Auto Formatting on Save" },
        { "<leader>ufe", "<cmd>:FormatEnable<CR>",  desc = "Enable Auto Formatting on Save" },
    },
    init = function()
        -- If you want the formatexpr, here is the place to set it
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
    config = function(_, opt)
        if pcall(require, 'which-key') then
            local wk = require('which-key')
            wk.add({
                { "<leader>uf", name = "Auto Formatting on Save", }
            })
        end

        local slow_format_filetypes = {}
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                -- Conform will run multiple formatters sequentially
                python = { "ruff_fix", "ruff_format" },
                -- Use a sub-list to run only the first available formatter
                javascript = {
                    { "prettierd", "prettier" }
                },
                typescript = {
                    { "prettierd", "prettier" }
                },
                astro = {
                    { "prettierd", "prettier" }
                },
                html = { "djlint" },
                htmldjango = { "djlint" }
            },

            format_on_save = function(bufnr)
                -- Disable autoformat on certain filetypes
                local ignore_filetypes = {}
                if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
                    return
                end
                -- Disable with a global or buffer-local variable
                if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                    return
                end
                if slow_format_filetypes[vim.bo[bufnr].filetype] then
                    return
                end
                local function on_format(err)
                    if err and err:match("timeout$") then
                        slow_format_filetypes[vim.bo[bufnr].filetype] = true
                    end
                end

                -- Disable autoformat for files in a certain path
                local bufname = vim.api.nvim_buf_get_name(bufnr)
                if bufname:match("/node_modules/") then
                    return
                end
                return { timeout_ms = 500, lsp_fallback = true }, on_format
            end,
            format_after_save = function(bufnr)
                if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                    return
                end

                if not slow_format_filetypes[vim.bo[bufnr].filetype] then
                    return
                end
                return { lsp_fallback = true }
            end,
        })



        vim.api.nvim_create_user_command("Format", function(args)
                local range = nil
                if args.count ~= -1 then
                    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
                    range = {
                        start = { args.line1, 0 },
                        ["end"] = { args.line2, end_line:len() },
                    }
                end
                require("conform").format({ async = true, lsp_fallback = true, range = range })
            end,
            {
                range = true
            }
        )


        vim.api.nvim_create_user_command("FormatDisable", function(args)
            if args.bang then
                -- FormatDisable! will disable formatting just for this buffer
                vim.b.disable_autoformat = true
            else
                vim.g.disable_autoformat = true
            end
        end, {
            desc = "Disable autoformat-on-save",
            bang = true,
        })

        vim.api.nvim_create_user_command("FormatEnable", function()
            vim.b.disable_autoformat = false
            vim.g.disable_autoformat = false
        end, {
            desc = "Re-enable autoformat-on-save",
        })
    end
}
