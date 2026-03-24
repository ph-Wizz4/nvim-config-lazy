-- Main plugin entry
-- Groups: general, theme, tools, ui enhancements
-- See individual plugin files for dependencies:
--   - markdown.lua (requires treesitter)
--   - lazygit.lua (requires telescope)
--   - ui.lua (noice + surround)
return {
	-- general
	{ "folke/todo-comments.nvim", opts = {}, },
	{ "echasnovski/mini.pairs", opts = {}, },

	-- theme
	{"scottmckendry/cyberdream.nvim", opts = {},},
	{ "folke/tokyonight.nvim", opts = {},},

	-- tools
	{'nvim-telescope/telescope.nvim', tag = '0.1.8',
	requires = { {'nvim-lua/plenary.nvim'} },},
	{ 'smithbm2316/centerpad.nvim' },

	-- catppuccin (theme integration)
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },

	-- pug-lsp
	{ "opa-oz/pug-lsp" },
}
