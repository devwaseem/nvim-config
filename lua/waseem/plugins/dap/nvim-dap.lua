return {
    'mfussenegger/nvim-dap',
    keys = {
        { '<leader>db', function() require('dap').toggle_breakpoint() end, desc = 'Toggle Breakpoint' },
        { '<leader>dc', function() require('dap').continue() end,          desc = 'Continue Execution' },
        { '<leader>ds', function() require('dap').step_into() end,         desc = 'Step Into' },
        { '<leader>do', function() require('dap').step_over() end,         desc = 'Step Over' },
        { '<leader>dO', function() require('dap').step_out() end,          desc = 'Step Out' },
        { '<leader>dr', function() require('dap').repl.open() end,         desc = 'Open REPL' },
        { '<leader>dl', function() require('dap').run_last() end,          desc = 'Run Last Debug Session' },
        { '<leader>dk', function() require('dap').terminate() end,         desc = 'Terminate Debug Session' },
        { '<leader>dK', function() require('dap').close() end,             desc = 'Close Debug Session' },
        { '<leader>dp', function() require('dap').pause() end,             desc = 'Pause Debug Session' },
        { '<leader>du', function() require('dap').up() end,                desc = 'Up Stack Frame' },
        { '<leader>dd', function() require('dap').down() end,              desc = 'Down Stack Frame' },
        { '<leader>dt', function() require('dap').toggle() end,            desc = 'Toggle Debug' },
        { '<leader>dv', function() require('dap').variables() end,         desc = 'View Variables' },
        { '<leader>dR', function() require('dap').run_to_cursor() end,     desc = 'Run to cursor' }
    },
    config = function()
        local dap = require('dap')

        dap.adapters.python = {
            type = 'executable',
            command = 'python', -- Use Poetry's Python interpreter
            args = { '-m', 'debugpy.adapter' },
        }

        dap.configurations.python = {
            {
                type = 'python',
                request = 'launch',
                name = 'Django Runserver',
                program = '${workspaceFolder}/manage.py', -- Adjust if `manage.py` is in a different location
                args = { 'runserver', '--noreload' },     -- Use runserver_plus or runserver
                django = true,                            -- This enables Django-specific features in `debugpy`
                justMyCode = false,                       -- Allows debugging libraries like Werkzeug
                console = 'integratedTerminal',           -- Use Neovim's integrated terminal
            },
        }
    end
}
