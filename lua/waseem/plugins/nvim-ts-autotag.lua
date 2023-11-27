return {
    "windwp/nvim-ts-autotag",
    -- event = { "InsertEnter *.html", "InsertEnter *.xml", "InsertEnter *.jsx", },
    config = function()
        require 'nvim-treesitter.configs'.setup {
            autotag = {
                enable = true,
            }
        }
        require('nvim-ts-autotag').setup({
            filetypes = { "html", "htmldjango", "svg", "xml" }
        })
    end,
}
