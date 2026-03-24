-- lualine (status line) configuration
-- Plugin: nvim-lualine/lualine.nvim
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'nord',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    }
  },
  sections = {
    lualine_a = {'mode', 'macro_recording'},
    lualine_b = { { 'branch', fmt = function (str) return str:sub(1, 6) end } , 'diff', 'diagnostics'},
    lualine_c = { { 'filename', path = 4, shorting_target = 35, symbols = { modified = '  ', readonly = '  ', unnamed = '  ' } } },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { { 'filename', path = 4, shorting_target = 90, symbols = { modified = '  ', readonly = '  ', unnamed = '  ' } } },
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
