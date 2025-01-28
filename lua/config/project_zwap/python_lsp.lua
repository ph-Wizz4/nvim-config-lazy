
vim.g.python3_host_prog = '/opt/anaconda3/envs/exp_env/bin/python'

vim.api.nvim_set_keymap('n', '<leader>ff', ':FormatBlack<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>f', ':FormatBlackRange<CR>', { noremap = true, silent = true })

-- Custom command to format the current file with Black
vim.api.nvim_create_user_command('FormatBlack', function()
    local current_file = vim.fn.expand('%:p') -- Get the full path of the current file
    local handle = io.popen('black ' .. current_file .. ' 2>&1') -- Run Black on the file
    local result = handle:read('*a') -- Read the output
    handle:close()

    -- Print the output in Neovim's command area
    if result ~= "" then
        print(result)
    else
        print("File formatted with Black")
    end
    
    -- Reload the buffer to see the changes
    vim.cmd('edit')
end, {})

-- Custom command to format a selected block of code with Black
vim.api.nvim_create_user_command('FormatBlackRange', function()
    -- Get the current visual selection
    local start_line = vim.fn.line("'<")
    local end_line = vim.fn.line("'>")
    
    -- Create a temporary file to store the selected code
    local temp_file = "/tmp/black_temp.py"  -- Adjust path as needed
    local lines = vim.fn.getline(start_line, end_line)
    vim.fn.writefile(lines, temp_file)

    -- Run Black on the temporary file
    local handle = io.popen('black ' .. temp_file .. ' 2>&1')
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


