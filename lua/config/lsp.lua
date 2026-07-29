-- LSP configuration and keymaps
-- Plugin: neovim/nvim-lspconfig
-- Enables built-in LSP for multiple languages

-- remap
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.show_line_diagnostics()<CR>',{ noremap=true, silent=true })
vim.api.nvim_set_keymap('n', '<leader>n', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap=true, silent=true })
vim.api.nvim_set_keymap('n', '<leader>N', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap=true, silent=true })

-- diagnostic
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",  -- Error icon (e.g., a cross)
      [vim.diagnostic.severity.WARN] = "",   -- Warning icon (e.g., a triangle)
      [vim.diagnostic.severity.INFO] = "",   -- Info icon (e.g., an 'i' in a circle)
      [vim.diagnostic.severity.HINT] = "",   -- Hint icon (e.g., a lightbulb)
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
      [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
      [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
      [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
    },
    linehl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticLineError",
      [vim.diagnostic.severity.WARN] = "DiagnosticLineWarn",
      [vim.diagnostic.severity.INFO] = "DiagnosticLineInfo",
      [vim.diagnostic.severity.HINT] = "DiagnosticLineHint",
    },
  },
})

-- enable
vim.lsp.enable("biome")
vim.lsp.enable("dockerls")
vim.lsp.enable("eslint")
vim.lsp.enable("lua_ls")
vim.lsp.enable("pug")
vim.lsp.enable("pyright")
vim.lsp.enable("tailwindcss")
vim.lsp.enable("tsgo")
vim.lsp.enable('prismals')
vim.lsp.enable('jdtls')
vim.lsp.enable('gopls')
