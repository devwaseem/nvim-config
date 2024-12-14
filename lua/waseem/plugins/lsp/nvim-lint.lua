local find_cmd = function(paths, default)
    return function()
        for _, path in ipairs(paths) do
            local cmd = vim.fn.fnamemodify(path, ':p')
            local stat = vim.loop.fs_stat(cmd)
            if stat then
                return cmd
            end
        end
        return default
    end
end

return {
    "mfussenegger/nvim-lint",
    dependencies = {
        "rshkarin/mason-nvim-lint",
    },
    ft = {
        'javascript',
        'javascriptreact',
        'python',
        "htmldjango",
    },
    event = { "BufEnter", },
    config = function()
        require('mason-nvim-lint').setup({
            ensure_installed = {
                "mypy",
                'ruff',
                "djlint",
                -- "dotenv-linter",
                "hadolint",
            },
        })

        local lint = require('lint')

        lint.linters.mypy.cmd = find_cmd({
            "./.venv/bin/mypy"
        }, "mypy")


        lint.linters_by_ft = {
            python = {
                'mypy',
                'ruff'
            },
            htmldjango = { "djlint" },
            html = { "djlint" },
            -- sh = {
            --     "dotenv-linter"
            -- },
            dockerfile = {
                "hadolint"
            }
        }

        vim.api.nvim_create_autocmd({
            'BufEnter',
            "BufWritePost",
            -- "InsertLeave",
        }, {
            callback = function()
                lint.try_lint()
            end,
        })

        vim.api.nvim_create_autocmd({
            'BufEnter',
            "InsertLeave",
        }, {
            pattern = 'python',
            callback = function()
                lint.try_lint('ruff')
            end,
        })


        local nmap = require('waseem.core.utils').nmap
        nmap('<leader>ll', function()
            lint.try_lint()
        end, "Run Linter")
    end
}
