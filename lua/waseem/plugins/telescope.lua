local is_inside_work_tree = {}
local utils = require("telescope.utils")
local builtin = require('telescope.builtin')

local function open_project_files()
    local ivy_theme = require('telescope.themes').get_ivy()

    local cwd = vim.fn.getcwd()
    if is_inside_work_tree[cwd] == nil then
        vim.fn.system("git rev-parse --is-inside-work-tree")
        is_inside_work_tree[cwd] = vim.v.shell_error == 0
    end

    if is_inside_work_tree[cwd] then
        builtin.git_files(
            vim.tbl_deep_extend("force", ivy_theme, {
                show_untracked = true
            })
        )
    else
        builtin.find_files(ivy_theme)
    end
end

return {
    "nvim-telescope/telescope.nvim",
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    keys = {
        -- Find
        { "<leader>ff",       function() open_project_files() end,                                     desc = "Find Project Files" },
        { "<leader><leader>", function() open_project_files() end,                                     desc = "Find Project Files" },
        { "<leader>fF",       "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<cr>",  desc = "Find All Files" },
        { "<leader>fb",       "<cmd>Telescope buffers sort_mru=true sort_lastused=true theme=ivy<cr>", desc = "Find Buffers" },
        { "<leader>fo",       function() require('telescope.builtin').oldfiles() end,                  desc = "Find Recent Opened files" },
        { "<leader>fc",       function() require('telescope.builtin').commands() end,                  desc = "Find Commands" },
        { "<leader>fm",       function() require('telescope.builtin').marks() end,                     desc = "Find Vim Marks" },
        { "<leader>fk",       function() require('telescope.builtin').keymaps() end,                   desc = "Find Keymaps" },
        { "<leader>f=",       "<cmd>Telescope resume<cr>",                                             desc = "Resume Last Find" },
        { "<leader>f/",       function() require('telescope.builtin').live_grep() end,                 desc = "Search in CWD" },

        -- Git
        { "<leader>gC",       function() require('telescope.builtin').git_commits() end,               desc = "Git Commits" },
        { "<leader>gc",       function() require('telescope.builtin').git_bcommits() end,              desc = "Git Commits (Current buffer)" },
        { "<leader>gb",       function() require('telescope.builtin').git_branches() end,              desc = "Git Branches" },


    },
    config = function()
        local telescope = require('telescope')
        local actions = require('telescope.actions')
        local my_theme = require('waseem.overrides.telescope').get_waseem_ivy_theme()

        telescope.setup {
            defaults = vim.tbl_deep_extend("force", my_theme, {
                mappings = {
                    i = {
                        ["<C-h>"] = "which_key",
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    },
                },
                path_display = { "truncate", },
                vimgrep_arguments = {
                    'rg',
                    '--hidden',
                    '--glob',
                    '!**/.git/*',
                    '--color=never',
                    '--no-heading',
                    '--with-filename',
                    '--line-number',
                    '--column',
                    '--smart-case',
                }
            }),
            pickers = {
                find_files = {
                    cwd = utils.buffer_dir(),
                    find_command = {
                        'fd',
                        '--type',
                        'f',
                        '--color=never',
                        '--hidden',
                        '--follow',
                        '-E',
                        '.git',
                        '-E',
                        '.venv',
                        '-E',
                        'node_modules'
                    },
                },
                oldfiles = {
                    cwd_only = true,
                    cwd = utils.buffer_dir(),
                }
            },
        }
        telescope.load_extension('fzf')
    end,
}
