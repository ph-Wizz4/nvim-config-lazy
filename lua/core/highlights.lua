return function ()
		vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#e63380' })
		vim.api.nvim_set_hl(0, 'CursorLineNr', { fg='#33cce6', bold=true})
		vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#fbda1a' })
		-- transparent bg
		vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
		vim.cmd([[hi NonText guibg=NONE ctermbg=NONE]])
		vim.cmd([[hi NormalNC guibg=NONE ctermbg=NONE]])
	end

