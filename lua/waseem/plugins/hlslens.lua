return {
    "kevinhwang91/nvim-hlslens",
    dependencies = {
        "nvim-scrollbar",
    },
    config = function()
        require("hlslens").setup({
            calm_down = true,
            nearest_only = true,
            build_position_cb = function(plist, _, _, _)
                if pcall(require, 'scrollbar') then
                    require("scrollbar.handlers.search").handler.show(plist.start_pos)
                end
            end,
        })

        if pcall(require, 'scrollbar') then
            vim.cmd([[
                augroup scrollbar_search_hide
                autocmd!
                autocmd CmdlineLeave : lua require('scrollbar.handlers.search').handler.hide()
                augroup END
            ]])
        end
    end,
}
