require("noice").setup({
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  presets = {
    bottom_search = true,
    command_palette = true,
    long_message_to_split = true,
    inc_rename = false,
    lsp_doc_border = false,
  },
})

vim.api.nvim_set_keymap('n', '<leader>nh', '<cmd>NoiceTelescope <CR>', {noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>nc', '<cmd>NoiceDismiss <CR>', {noremap = true, silent = true })
