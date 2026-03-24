-- Theme/colorscheme configuration
-- Plugin: scottmckendry/cyberdream.nvim
local THEME = "cyberdream"

vim.cmd.colorscheme(THEME)

local set_highlight = require('core.highlights');

set_highlight()

print(string.format("Activated colorscheme: %s", THEME))
