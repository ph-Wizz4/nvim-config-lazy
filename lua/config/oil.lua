vim.api.nvim_set_hl(0, "FloatBorder", { fg='#33cce6' })
require("oil").setup({
  float = {
    -- Padding around the floating window
    padding = 5,
    max_width = 0,
    max_height = 0,
    border = {
      { '┌', 'FloatBorder' },
      { '─', 'FloatBorder' },
      { '┐', 'FloatBorder' },
      { '│', 'FloatBorder' },
      { '┘', 'FloatBorder' },
      { '─', 'FloatBorder' },
      { '└', 'FloatBorder' },
      { '│', 'FloatBorder' },
    },
    win_options = {
      winblend = 0,
    },
    -- Preview split direction: "auto", "left", "right", "above", "below"
    preview_split = "left",
  },
})

