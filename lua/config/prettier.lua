
vim.api.nvim_create_user_command("FormatFile", function ()
    local current_file = vim.fn.expand('%:p') -- Get the full path of the current file
    local handle = io.popen('prettier --write ' .. current_file .. ' 2>&1') -- Run Black on the file
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

vim.api.nvim_create_user_command('FormatBlackRange', function()
    -- Get the current visual selection
    local start_line = vim.fn.line("'<")
    local end_line = vim.fn.line("'>")
    
    -- Create a temporary file to store the selected code
    local temp_file = "/tmp/prettier_temp.py"  -- Adjust path as needed
    local lines = vim.fn.getline(start_line, end_line)
    vim.fn.writefile(lines, temp_file)

    -- Run Black on the temporary file
    local handle = io.popen('prettier' .. temp_file .. ' 2>&1')
    local result = handle:read('*a')
    handle:close()

    -- Read the formatted code back into Neovim
    local formatted_lines = vim.fn.readfile(temp_file)

    -- Replace the selected lines with the formatted lines
    vim.fn.setline(start_line, formatted_lines)
    vim.cmd("normal! " .. start_line .. "G")  -- Move the cursor back to the original position
    
    -- Optionally, delete the temporary file
    os.remove(temp_file)

    -- Print the result or any errors
    if result ~= "" then
        print(result)
    else
        print("Selected block formatted with Black")
    end
end, { range = true })



-- Keymapping for formatting
vim.api.nvim_set_keymap('n', '<leader>F', '<cmd>FormatFile<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>F', '<cmd>FormatFileRange<CR>', { noremap = true, silent = true })


