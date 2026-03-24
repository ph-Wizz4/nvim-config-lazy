-- Copilot configuration and keymaps
-- Plugin: CopilotC-Nvim/CopilotChat.nvim, github/copilot.vim
vim.api.nvim_set_keymap('n', '<leader>i', "<cmd>CopilotChatToggle<CR>",{ noremap= true, silent= false})
vim.api.nvim_set_keymap('n', '<leader>id', "<cmd>Copilot disable<CR>",{ noremap= true, silent= false})
vim.api.nvim_set_keymap('n', '<leader>ie', "<cmd>Copilot enable<CR>", { noremap= true, silent= false})

vim.cmd("Copilot disable")
