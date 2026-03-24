-- lazygit.nvim
-- Requires: telescope.nvim, plenary.nvim (loaded via telescope extension)
-- Related: config/lazy_git.lua (configuration)
return {
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
}
