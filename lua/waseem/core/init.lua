require "waseem.core.options"
require "waseem.core.autocmds"
require "waseem.core.keymaps"

function R(name)
    require("plenary.reload").reload_module(name)
end
