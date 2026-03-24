-- render-markdown.nvim
-- Requires: nvim-treesitter (for markdown parsing)
-- Related: config/prettier.lua (formatting)
return {
	{
		'MeanderingProgrammer/render-markdown.nvim',
		after = { 'nvim-treesitter' },
		requires = { 'echasnovski/mini.nvim', opt = true },
		config = function()
			require('render-markdown').setup({})
		end,
	},
}
