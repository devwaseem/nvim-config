function get_highlight_color()
    local highlight_name = "VirtColumn"
    local color = "red"
    if pcall(require, 'material') then
        local colors = require('material.colors')
        color = colors.editor.line_numbers
    end
    vim.cmd("highlight " .. highlight_name .. " ctermbg=0 guifg=" .. color)
    return highlight_name
end

return {
    "lukas-reineke/virt-column.nvim",
    event = "BufReadPost",
    config = function()
        require("virt-column").setup({
            char = "│",
            highlight = { get_highlight_color() }
        })
    end
}
