return {
    {
        "mfussenegger/nvim-dap",
    },
    {
        "nvim-neotest/nvim-nio",
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["debug_config"] = function()
                dapui.open()
            end
            dap.listeners.after.event_terminated["debug_config"] = function()
                dapui.close()
            end
            dap.listeners.after.event_exited["debug_config"] = function()
                dapui.close()
            end
        end,
    },
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },
        config = function(_, opts)
            local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
            require("dap-python").setup(path)
            -- vim.keymap.set("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Keymap for breakpoint" })
            -- vim.keymap.set("n", "<leader>dpr", function()
            --   require("dap-python").test_method()
            -- end, { desc = "Run test" })
        end,
    },
}
