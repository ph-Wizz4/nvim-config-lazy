return function ()
	vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#e63380' })
	vim.api.nvim_set_hl(0, 'CursorLineNr', { fg='#33cce6', bold=true})
	vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#fbda1a' })
	vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })
	vim.api.nvim_set_hl(0, 'NonText', { bg = 'NONE' })
	vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'NONE' })
end

