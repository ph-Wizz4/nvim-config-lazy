vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='yellow' })
vim.api.nvim_set_hl(0, 'LineNr', { fg='yellow', bg='blue', bold=true})
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='yellow' })

vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
vim.cmd([[hi NonText guibg=NONE ctermbg=NONE]])
vim.cmd([[hi NormalNC guibg=NONE ctermbg=NONE]])
