return {
    'code-biscuits/nvim-biscuits',
    event = { "BufReadPost" },
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    },
    config = function()
        require('nvim-biscuits').setup({
            -- on_events = { 'InsertLeave', 'CursorHoldI' },
            default_config = {
                -- max_length = 12,
                -- min_distance = 5,
                prefix_string = " 󱞩 "
            },
            cursor_line_only = true,
        })

        if pcall(require, 'material') then
            local colors = require('material.colors')
            vim.api.nvim_set_hl(0, 'BiscuitColor', { fg = colors.editor.line_numbers })
        end
    end
}
