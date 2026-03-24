-- DAP (Debug Adapter Protocol) configuration
-- Plugin: mfussenegger/nvim-dap, rcarriga/nvim-dap-ui
vim.api.nvim_set_keymap('n', '<leader>b', "<cmd>lua require('dap').toggle_breakpoint()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<leader>5', "<cmd>lua require('dap').continue()<CR>", {silent = true, noremap = true})

vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = 'DiagnosticError', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointCondition', { text = '🔄', texthl = 'DiagnosticWarn', linehl = '', numhl = '' })
vim.fn.sign_define('DapLogPoint', { text = '📝', texthl = 'DiagnosticInfo', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '→', texthl = 'DiagnosticInfo', linehl = 'DebugLine', numhl = '' })
vim.fn.sign_define('DapBreakpointRejected', { text = '❌', texthl = 'DiagnosticError', linehl = '', numhl = '' })
