
vim.api.nvim_create_user_command("FormatFile", function ()
    local current_file = vim.fn.expand('%:p') -- Get the full path of the current file
    local handle = io.popen('prettier --write ' .. string.format('"%s"', current_file) .. ' 2>&1') -- Run Black on the file
    local result = handle:read('*a') -- Read the output
    handle:close()

    -- Print the output in Neovim's command area
	if result ~= "" then
		print("File formatted successfully with Prettier.")
	else
		print("Error formatting file:\n" .. result)
	end
    -- Reload the buffer to see the changes
    vim.cmd('edit')
	end, {}
)

-- Keymapping for formatting
vim.api.nvim_set_keymap('n', '<leader>F', '<cmd>FormatFile<CR>', { noremap = true, silent = true })


