-- Gitsigns keymaps
-- Plugin: lewis6991/gitsigns.nvim
vim.api.nvim_set_keymap('n', '<leader>lb', '<cmd>Gitsigns toggle_current_line_blame<CR>', {noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gn', '<cmd>Gitsigns next_hunk<CR>', {noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gN', '<cmd>Gitsigns prev_hunk<CR>', {noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>rh', '<cmd>Gitsigns reset_hunk<CR>', {noremap = true, silent = true })
