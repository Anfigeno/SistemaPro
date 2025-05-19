require("code_runner").setup({
	filetype = {
		typescript = "bun",
	},
})

vim.keymap.set("n", "<s-r>", "<cmd>RunCode<cr>", {
	desc = "Ejecuta el código",
})
