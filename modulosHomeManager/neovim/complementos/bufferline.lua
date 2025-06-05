require("scope").setup({})

require("bufferline").setup({
	highlights = require("mestizo.claves.integraciones.especial.bufferline"),
	options = {
		offsets = {
			{
				filetype = "neo-tree",
				text = "Archivos",
				highlight = "NeotreeNormal",
				text_align = "center",
				separator = true,
			},
		},
	},
})

vim.keymap.set("n", "<tab>", "<cmd>BufferLineCycleNext<cr>")
vim.keymap.set("n", "<s-tab>", "<cmd>BufferLineCyclePrev<cr>")
vim.keymap.set("n", "<space>x", "<cmd>bp<bar>sp<bar>bn<bar>bd<CR>")
vim.keymap.set("n", "<c-t>", "<cmd>tabnew<cr>")
vim.keymap.set("n", "<m-t>", "<cmd>tabnext<cr>")
