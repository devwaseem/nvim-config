return {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    enabled = false,
    event = "LspAttach",
    config = function()
        vim.diagnostic.config({
            virtual_text = false,
        })
        vim.diagnostic.config({ virtual_lines = { only_current_line = true } })
        require("lsp_lines").setup()
    end
}
