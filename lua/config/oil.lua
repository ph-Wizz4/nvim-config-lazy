require("oil").setup({
  float = {
    -- Padding around the floating window
    padding = 5,
    max_width = 0,
    max_height = 0,
    border = "single", -- Options: "single", "double", "shadow", "rounded"
    win_options = {
      winblend = 0,
    },
    -- Preview split direction: "auto", "left", "right", "above", "below"
    preview_split = "left",
  },
})

