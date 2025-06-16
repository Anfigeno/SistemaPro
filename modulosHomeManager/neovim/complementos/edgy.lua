vim.opt.laststatus = 3
vim.opt.splitkeep = "screen"

local edgy = require("edgy")

edgy.setup({
	animate = { enabled = false },
	right = {
		{
			title = "Simbolos",
			ft = "trouble",
			filter = function(_, win)
				return vim.w[win].trouble.mode == "symbols"
			end,
			size = { height = 0.5, width = 0.2 },
			pinned = true,
			collapsed = false,
			open = "Trouble symbols toggle focus=true",
		},
		{
			title = "Diagnosticos",
			ft = "trouble",
			filter = function(_, win)
				return vim.w[win].trouble.mode == "diagnostics"
			end,
			size = { height = 0.5, width = 0.2 },
			pinned = true,
			collapsed = false,
			open = "Trouble diagnostics toggle focus=false",
		},
	},
})

vim.keymap.set("n", "<c-l>", function()
	edgy.toggle("right")
end)
