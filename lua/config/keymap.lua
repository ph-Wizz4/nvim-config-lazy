vim.g.mapleader = " "

-- lazy
vim.api.nvim_set_keymap('n', '<leader>l', '<cmd>Lazy<CR>', {noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>pv", "<cmd>Ex<CR>", {noremap = true, silent = true })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- vim.api.nvim_set_keymap("v", "J", "<cmd>m '>+1<CR>gv=gv<CR>", {noremap = true, silent = true })
-- vim.api.nvim_set_keymap("v", "K", "<cmd>:m '<-2<CR>gv=gv<CR>", {noremap = true, silent = true })
