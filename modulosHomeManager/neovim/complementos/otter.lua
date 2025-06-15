local otter = require("otter")

otter.setup({
	lsp = {
		diagnostic_update_events = { "InsertLeave", "TextChanged" },
	},
})

-- Comando para activar Otter
vim.api.nvim_create_user_command("Otter", function()
	otter.activate(nil, true, true, nil)
end, { desc = "Activar Otter" })

local lenguajes_para_otter = {
	"nix",
	"md",
}
-- Activar Otter automáticamente en cada buffer de tipo nix
vim.api.nvim_create_autocmd("FileType", {
	pattern = lenguajes_para_otter,
	callback = function()
		otter.activate(nil, true, true, nil)
	end,
	desc = "Activar Otter en buffers de tipo " .. table.concat(lenguajes_para_otter, ", "),
})
