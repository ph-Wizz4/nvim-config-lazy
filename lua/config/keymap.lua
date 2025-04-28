vim.g.mapleader = " "

-- lazy
vim.api.nvim_set_keymap('n', '<leader>l', '<cmd>Lazy<CR>', {noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>pv", "<cmd>Ex<CR>", {noremap = true, silent = true })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- vim.api.nvim_set_keymap("v", "J", "<cmd>m '>+1<CR>gv=gv<CR>", {noremap = true, silent = true })
-- vim.api.nvim_set_keymap("v", "K", "<cmd>:m '<-2<CR>gv=gv<CR>", {noremap = true, silent = true })


-- nav
-- Terminal mode mappings
-- Map <Esc> to exit terminal mode
-- vim.api.nvim_set_keymap('t', '<+>', '<C-\\><C-n>', { noremap = true, silent = true })
-- Simulate Ctrl-R in terminal mode to insert the character that follows
vim.api.nvim_set_keymap('t', '<C-R>', [[<C-\><C-N>"..vim.fn.nr2char(vim.fn.getchar())..'pi']], { noremap = true, expr = true, silent = true })

-- Use ALT+{h,j,k,l} to navigate windows from terminal mode
vim.api.nvim_set_keymap('t', '<A-h>', '<C-\\><C-N><C-w>h', { noremap = true, silent = true }) -- Move to left window
vim.api.nvim_set_keymap('t', '<A-j>', '<C-\\><C-N><C-w>j', { noremap = true, silent = true }) -- Move to bottom window
vim.api.nvim_set_keymap('t', '<A-k>', '<C-\\><C-N><C-w>k', { noremap = true, silent = true }) -- Move to top window
vim.api.nvim_set_keymap('t', '<A-l>', '<C-\\><C-N><C-w>l', { noremap = true, silent = true }) -- Move to right window

-- Insert mode mappings
-- Use ALT+{h,j,k,l} to navigate windows from insert mode
vim.api.nvim_set_keymap('i', '<A-h>', '<C-\\><C-N><C-w>h', { noremap = true, silent = true }) -- Move to left window
vim.api.nvim_set_keymap('i', '<A-j>', '<C-\\><C-N><C-w>j', { noremap = true, silent = true }) -- Move to bottom window
vim.api.nvim_set_keymap('i', '<A-k>', '<C-\\><C-N><C-w>k', { noremap = true, silent = true }) -- Move to top window
vim.api.nvim_set_keymap('i', '<A-l>', '<C-\\><C-N><C-w>l', { noremap = true, silent = true }) -- Move to right window

-- Normal mode mappings
-- Use ALT+{h,j,k,l} to navigate windows from normal mode
vim.api.nvim_set_keymap('n', '<A-h>', '<C-w>h', { noremap = true, silent = true }) -- Move to left window
vim.api.nvim_set_keymap('n', '<A-j>', '<C-w>j', { noremap = true, silent = true }) -- Move to bottom window
vim.api.nvim_set_keymap('n', '<A-k>', '<C-w>k', { noremap = true, silent = true }) -- Move to top window
vim.api.nvim_set_keymap('n', '<A-l>', '<C-w>l', { noremap = true, silent = true }) -- Move to right window
