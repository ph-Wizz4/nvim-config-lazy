-- toggleterm configuration
-- Plugin: akinsho/toggleterm.nvim
require("toggleterm").setup({
    open_mapping = [[<c-j>]],  -- Key mapping to toggle the terminal
    shade_filetypes = {},
    shade_terminal = true,
    persist_size = true,
    direction = 'horizontal',  -- Options: 'horizontal', 'vertical', 'tab', 'float'
    close_on_exit = true,      -- Close the terminal window when the process exits
    shell = vim.o.shell,       -- Specify your shell (default is the value of vim.o.shell)
    float_opts = {
        border = 'curved',     -- Options: 'single', 'double', 'shadow', 'curved', etc.
        winblend = 3,         -- Transparency of the terminal window
		Transparency = 0.1,
	},
	on_open = function(term)
		-- Ensure C-r passes through directly to the shell inside toggleterm buffers
		vim.keymap.set('t', '<C-r>', function()
			vim.api.nvim_feedkeys(
				vim.api.nvim_replace_termcodes('<C-r>', true, false, true),
				'n',
				false
			)
		end, { buffer = term.bufnr, noremap = true, silent = true })
	end,
})

