-- Theme/colorscheme configuration
-- Plugin: scottmckendry/cyberdream.nvim
local THEME = "cyberdream"

vim.cmd.colorscheme(THEME)

-- transparent
vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
vim.cmd([[hi NonText guibg=NONE ctermbg=NONE]])
vim.cmd([[hi NormalNC guibg=NONE ctermbg=NONE]])
print(string.format("Activated colorscheme: %s", THEME))
