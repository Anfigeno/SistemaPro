local capabilities = require("cmp_nvim_lsp").default_capabilities()
local navic = require("nvim-navic")

local on_attach = function(client, bufnr)
	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end
end

require("auto-lsp").setup({
	["*"] = function()
		return {
			on_attach = on_attach,
			capabilities = capabilities,
		}
	end,
	["lua_ls"] = function()
		return {
			on_attach = on_attach,
			capabilities = capabilities,
			settings = { Lua = { hint = {
				enable = true,
				setType = true,
			} } },
		}
	end,
	["ts_ls"] = function()
		return {
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				javascript = {
					inlayHints = {
						includeInlayEnumMemberValueHints = true,
						includeInlayFunctionLikeReturnTypeHints = true,
						includeInlayFunctionParameterTypeHints = true,
						includeInlayParameterNameHints = "all",
						includeInlayParameterNameHintsWhenArgumentMatchesName = true,
						includeInlayPropertyDeclarationTypeHints = true,
						includeInlayVariableTypeHints = true,
					},
				},
				typescript = {
					inlayHints = {
						includeInlayEnumMemberValueHints = true,
						includeInlayFunctionLikeReturnTypeHints = true,
						includeInlayFunctionParameterTypeHints = true,
						includeInlayParameterNameHints = "all",
						includeInlayParameterNameHintsWhenArgumentMatchesName = true,
						includeInlayPropertyDeclarationTypeHints = true,
						includeInlayVariableTypeHints = true,
					},
				},
			},
		}
	end,
	["gopls"] = function()
		return {
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				gopls = {
					["ui.inlayhint.hints"] = {
						assignVariableTypes = true,
						compositeLiteralFields = true,
						compositeLiteralTypes = true,
						constantValues = true,
						functionTypeParameters = true,
						parameterNames = true,
						rangeVariableTypes = true,
					},
				},
			},
		}
	end,
})
