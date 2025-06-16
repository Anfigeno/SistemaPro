require("workspaces").setup({
	hooks = {
		open = {
			function()
				vim.cmd("Neotree toggle")
			end,
		},
	},
})

local telescope = require("telescope")
telescope.load_extension("workspaces")

vim.keymap.set("n", "<space>fw", "<cmd>Telescope workspaces<cr>", {})
