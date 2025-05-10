require("toggleterm-manager").setup({})

vim.keymap.set("n", "<space>fj", "<cmd>Telescope toggleterm_manager<cr>", { desc = "Telescope toggleterm manager" })
