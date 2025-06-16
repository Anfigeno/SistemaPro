require("telescope").setup({
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",

		sorting_strategy = "ascending",
		layout_config = {
			horizontal = {
				prompt_position = "top",
			},
			height = 0.80,
		},
	},
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<space>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<space>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<space>fs", builtin.lsp_document_symbols, { desc = "Telescope simbolos" })
vim.keymap.set("n", "<space>fR", builtin.lsp_workspace_symbols, { desc = "Telescope referencias" })
vim.keymap.set("n", "<space>fr", builtin.lsp_references, { desc = "Telescope referencias" })
