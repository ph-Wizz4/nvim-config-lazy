-- lazydev.nvim: Lua LSP development assistance
-- Only loads for lua files
-- Related: config/lazydev.lua (configuration)
return {{
	"folke/lazydev.nvim",
	ft = "lua",
	opts = {
		library = {
			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
		},
	},
}}
