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
	}


}
