require("dap-go").setup({})

require("nvim-dap-virtual-text").setup({
	highlight_changed_variables = true,
})

local dap = require("dap")
local dapui = require("dapui")

dapui.setup({})

dap.listeners.after.event_initialized["dapui_config"] = dapui.open
dap.listeners.before.event_term = dapui.close
dap.listeners.before.event_exited["dapui_config"] = dapui.close

vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "Debug: Alternar punto de interrupción" })
vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Debug: Continuar" })
vim.keymap.set("n", "<leader>dR", dap.repl.open, { desc = "Debug: Inspeccionar" })
vim.keymap.set("n", "<leader>dk", dap.terminate, { desc = "Debug: Terminar debug" })

vim.keymap.set("n", "<leader>dso", dap.step_over, { desc = "Debug: Pasar" })
vim.keymap.set("n", "<leader>dsi", dap.step_into, { desc = "Debug: Entrar en" })
vim.keymap.set("n", "<leader>dsu", dap.step_out, { desc = "Debug: Salir" })
vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "Debug: Ejecutar ultimo" })

vim.keymap.set("n", "<leader>dv", dapui.toggle, { desc = "Debug: Alternar interfaz" })
