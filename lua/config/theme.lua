-- active theme
local THEME = "cyberdream"

vim.cmd.colorscheme(THEME)
print(string.format("Activated colorscheme: %s", THEME))

-- high light
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='yellow' })
vim.api.nvim_set_hl(0, 'LineNr', { fg='yellow', bg='blue', bold=true})
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='yellow' })

-- visual
vim.opt.smarttab = true
vim.opt.rnu = true
vim.opt.nu = true
vim.opt.scrolloff = 99
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.o.wrap = false

-- transparent --
vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
vim.cmd([[hi NonText guibg=NONE ctermbg=NONE]])
vim.cmd([[hi NormalNC guibg=NONE ctermbg=NONE]])

-- center pad --
vim.api.nvim_set_keymap('n', '<leader>c', "<cmd>lua require'centerpad'.toggle{ leftpad = 40, rightpad = 40 }<cr>", { silent = true, noremap = true })

