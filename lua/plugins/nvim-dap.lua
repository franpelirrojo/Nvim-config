return {
    -- Cliente DAP(adaptador de depuerador) para nvim
    "mfussenegger/nvim-dap",
    dependencies = {
        -- ui plugins
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio"
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")
        dapui.setup()

        -- Lanza la ui cuando se inicial la depuración
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end

        vim.keymap.set("n", "<leader>Db", dap.toggle_breakpoint, { desc = "[D]ebug [B]reakpoint" })
        vim.keymap.set("n", "<leader>Ds", dap.continue, { desc = "[D]ebug [S]tart" })
        vim.keymap.set("n", "<leader>Dc", dapui.close, {desc = "[D]ebug [C]lose"})
        vim.keymap.set("n", "<F7>", dap.step_into, {desc = "Step into"})
        vim.keymap.set("n", "<F8>", dap.step_over, {desc = "Step over"})
    end
}
