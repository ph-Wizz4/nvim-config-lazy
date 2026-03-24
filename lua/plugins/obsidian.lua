-- obsidian.nvim: Obsidian note-taking app integration
-- Requires: plenary.nvim
-- Related: config/obsidian.lua (keymaps)
return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = false,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },

  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    workspaces = {
      {
        name = "general",
        path = "$OBSIDIAN_VAULT/",
      },
      {
        name = "personal",
        path = "$OBSIDIAN_VAULT/personal/",
      },
      {
        name = "working",
        path = "$OBSIDIAN_VAULT/working/",
      },
      {
        name = "learning",
        path = "$OBSIDIAN_VAULT/learning/",
      },
    },
	-- other fields ...
	templates = {
		folder = "templates/",
		date_format = "%Y-%m-%d",
		time_format = "%H:%M",
	},
	daily_notes = {
		-- Optional, if you keep daily notes in a separate directory.
		folder = "working/daily/",
		-- Optional, if you want to change the date format for the ID of daily notes.
		date_format = "%Y-%m-%d",
		-- Optional, if you want to change the date format of the default alias of daily notes.
		alias_format = "%B %-d, %Y",
		-- Optional, default tags to add to each new daily note created.
		default_tags = { "work-daily" },
		-- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
		template = "work_daily.md",
	},
	ui = {
		enable = false,
	}
    -- see below for full list of options 👇
  },
}
