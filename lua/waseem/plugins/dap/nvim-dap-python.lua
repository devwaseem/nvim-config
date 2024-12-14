return {
    'mfussenegger/nvim-dap-python',
    ft = "python",
    config = function()
        local dap_python = require('dap-python')
        dap_python.setup('./.venv/bin/python')
        dap_python.test_runner = { 'pytest', 'unittest' }
    end
}
