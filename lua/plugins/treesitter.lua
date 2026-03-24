-- nvim-treesitter: Syntax highlighting and parsing
-- Related: config/treesitter.lua (configuration)
-- Related: plugins/markdown.lua (requires treesitter for markdown)
return {
  {"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = true, build = ":TSUpdate"}
}
