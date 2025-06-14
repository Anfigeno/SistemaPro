local mestizo_lualine = require("mestizo.claves.integraciones.especial.lualine")
local navic = require("nvim-navic")

local winbar = {
	lualine_a = {
		{
			"navic",
			color_correction = nil,
			navic_opts = nil,
		},
	},
	lualine_z = {
		"require('nvim-web-devicons').get_icon_by_filetype(vim.bo.filetype, { default = true })",
		{
			"filename",
			file_status = false,
			new_file_status = false,
		},
	},
}

require("lualine").setup({
	options = {
		theme = mestizo_lualine.tema,
		component_separators = "",
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			winbar = { "neo-tree", "toggleterm", "trouble" },
		},
	},
	sections = mestizo_lualine.secciones,
	winbar = winbar,
	inactive_winbar = winbar,
})
