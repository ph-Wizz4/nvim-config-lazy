local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pq', builtin.quickfix, {})
vim.keymap.set('n', '<leader>pm', builtin.marks, {})
vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
vim.keymap.set('n', '<leader>pd', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });

end)

vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols, {})

vim.keymap.set('n', '<leader>pS', function()
	local selected_text = vim.fn.getreg('"')
    if selected_text == '' then
        print("No text selected!")
        return
    end
    -- Use Telescope to grep the selected text
    builtin.grep_string({ search = selected_text });
end)
