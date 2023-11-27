return {
    {
        "David-Kunz/gen.nvim",
        -- keys = {
        --     { "<leader>`", "<cmd>Gen", "Show AI" }
        -- },
        cmd = { "Gen" },
        opts = {
            model = "deepseek-coder", -- The default model to use.
            display_mode = "split",   -- The display mode. Can be "float" or "split".
            show_prompt = true,       -- Shows the Prompt submitted to Ollama.
            show_model = true,        -- Displays which model you are using at the beginning of your chat session.
            no_auto_close = true,     -- Never closes the window automatically.
            init = function(options) pcall(io.popen, "ollama serve > /dev/null 2>&1 &") end,
            debug = false             -- Prints errors and the command which is run.
        }
    },
}
