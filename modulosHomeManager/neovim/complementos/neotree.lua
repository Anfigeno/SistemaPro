require("neo-tree").setup({
	sources = { "filesystem" },
	open_files_do_not_replace_types = {
		"terminal",
		"Trouble",
		"qf",
		"edgy",
	},
	popup_border_style = "rounded",
	enable_git_status = false,
	enable_diagnostics = true,
	filesystem = {
		filtered_items = {
			visible = false,
			hide_dotfiles = false,
			hide_gitignored = true,
			respect_gitignore = true,
		},
	},
	event_handlers = {
		{
			event = "file_opened",
			handler = function()
				require("neo-tree.command").execute({ action = "close" })
			end,
		},
	},
})

vim.keymap.set("n", "<c-h>", "<cmd>Neotree toggle<cr>", { desc = "Alternar Neotree" })
