return {
    'ntpeters/vim-better-whitespace',
    event = "BufReadPost",
    config = function()
        local is_material_installed, colors = pcall(require, 'material.colors')
        if is_material_installed then
            vim.cmd("highlight ExtraWhitespace guibg=" .. colors.main.red)
        end
    end

}
