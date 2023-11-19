local utils = require('waseem.core.utils')
local nmap = utils.nmap

-- Diagnostics
nmap(']d', vim.diagnostic.goto_next, "Go to Next Diagnostic")
nmap('[d', vim.diagnostic.goto_prev, "Go to Prev Diagnostic")
