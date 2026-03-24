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
})
