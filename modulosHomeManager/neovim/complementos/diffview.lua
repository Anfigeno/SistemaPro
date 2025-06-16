require("diffview").setup()

vim.keymap.set("n", "<leader>df", "<cmd>DiffviewOpen<cr>", { desc = "Abrir Diffview" })
vim.keymap.set("n", "<leader>dF", "<cmd>DiffviewClose<cr>", { desc = "Cerrar Diffview" })
