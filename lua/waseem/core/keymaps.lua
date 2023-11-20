local utils = require('waseem.core.utils')
local nmap = utils.nmap
local vmap = utils.vmap

--
nmap('<leader>w', "<cmd>w<CR>", "Save File")

-- Diagnostics
nmap(']d', vim.diagnostic.goto_next, "Go to Next Diagnostic")
nmap('[d', vim.diagnostic.goto_prev, "Go to Prev Diagnostic")

-- Buffers
nmap({ ']b', '<S-l>', "<leader>bn" }, "<cmd>bnext<CR>", "Go to Next Buffer")
nmap({ '[b', '<S-h>', "<leader>bp" }, "<cmd>bprevious<CR>", "Go to Previous Buffer")
nmap({ '<leader>c', "<leader>bc" }, "<cmd>bdelete<CR>", "Close Current Buffer")

-- Move lines
vmap({ "J" }, ":m '>+1<CR>gv=gv", "Move line down")
vmap({ "K" }, ":m '<-2<CR>gv=gv", "Move line down")

-- Center screen when scrolling
nmap("<C-d>", "<C-d>zz", "Move Down")
nmap("<C-u>", "<C-u>zz", "Move Up")
