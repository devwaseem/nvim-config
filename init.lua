-- TODO:
-- dap
-- highlighter
-- tailwindcss
-- Tip
-- ufo


vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("waseem.core")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
    { { import = "waseem.plugins" }, { import = "waseem.plugins.lsp" }, { import = "waseem.plugins.telescope" } },
    {
        checker = {
            enabled = true,
            notify = false,
        },
        change_detection = {
            notify = false,
        },
        performance = {
            rtp = {
                -- customize default disabled vim plugins
                disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
            },
        },

    })


-- vim.cmd.colorscheme "catppuccin"
vim.cmd.colorscheme "material"
