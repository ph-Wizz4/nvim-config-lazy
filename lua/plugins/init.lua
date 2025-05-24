return {
	-- general
	{ "folke/todo-comments.nvim", opts = {}, },
	{ "echasnovski/mini.pairs", opts = {}, },
	{ "akinsho/toggleterm.nvim", opts = {}, },

	-- theme
	{"scottmckendry/cyberdream.nvim", opts = {},},
	{ "folke/tokyonight.nvim", opts = {},},

	{'nvim-telescope/telescope.nvim', tag = '0.1.8',
	requires = { {'nvim-lua/plenary.nvim'} },},

	{ 'nvim-treesitter/nvim-treesitter', opts = {}, },

	-- center
	{ 'smithbm2316/centerpad.nvim' },

	-- md
	{
		'MeanderingProgrammer/render-markdown.nvim',
		after = { 'nvim-treesitter' },
		requires = { 'echasnovski/mini.nvim', opt = true },
		config = function()
			require('render-markdown').setup({})
		end,
	},


	-- Git and lazy git
	{
		"kdheepak/lazygit.nvim",
		requires = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("telescope").load_extension("lazygit")
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		config = function ()
			require('gitsigns').setup()
		end,
	},

	-- noice
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		}
	},

	-- catppuccin
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	-- surround
	{
		"kylechui/nvim-surround",
		version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end
	},

	-- pug lsp
	{ "opa-oz/pug-lsp", config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end
	}
}
