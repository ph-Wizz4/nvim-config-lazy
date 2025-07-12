return {
	-- LSP Configuration
	{ 'neovim/nvim-lspconfig',
	config = function ()
		-- language config
		local lspconfig = require('lspconfig')

		lspconfig.eslint.setup({
			on_attach = function(client, bufnr)
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					command = "EslintFixAll",
				})
			end,
		})	

		lspconfig.tailwindcss.setup({})

		-- tsconfig
		lspconfig.ts_ls.setup {
			on_attach = on_attach,
			cmd = {"typescript-language-server", "--stdio"},
			filetypes ={ "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
			root_dir = lspconfig.util.root_pattern("package.json"),
		}

		-- lua
		lspconfig.lua_ls.setup {
			on_init = function(client)
				if client.workspace_folders then
					local path = client.workspace_folders[1].name
					if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
						return
					end
				end

				client.config.settings.lua = vim.tbl_deep_extend('force', client.config.settings.lua, {
					runtime = {
						-- tell the language server which version of lua you're using
						-- (most likely luajit in the case of neovim)
						version = 'luajit'
					},
					-- make the server aware of neovim runtime files
					workspace = {
						checkthirdparty = false,
						library = {
							vim.env.vimruntime
							-- depending on the usage, you might want to add additional paths here.
							-- "${3rd}/luv/library"
							-- "${3rd}/busted/library",
						}
						-- or pull in all of 'runtimepath'. note: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
						-- library = vim.api.nvim_get_runtime_file("", true)
					}
				})
			end,
			settings = {
				lua = {}
			}
		}
	
		-- python (project_zwap)
		lspconfig.pyright.setup{
			cmd = {"/opt/anaconda3/envs/exp_env/bin/pyright-langserver", "--stdio"},  -- specify the command to run the language server
			-- cmd = {"/opt/anaconda3/envs/nvim_pylance_env/bin/pyright-langserver", "--stdio"},  -- specify the command to run the language server
			settings = {
				python = {
					analysis = {
						typecheckingmode = "basic",
						autosearchpath = true,
						uselibrarycodefortypes = true,
					},
					plugins = {
						flake8 = {enabled = true},
						black = {
							enabled = true,
							path = "/opt/anaconda3/envs/nvim_zwap_env/bin/black"
						},
					},

				}
			},
			filetypes = { "python", "py", }
		}

		-- biome
		lspconfig.biome.setup{
			cmd = {"biome", "lsp-proxy"},  -- Specify the command to run the language server
			filetypes = { "astro", "css", "graphql", "javascript", "javascriptreact", "json", "jsonc", "svelte", "typescript", "typescript.tsx", "typescriptreact", "vue" },
			workspace_required = false,
		 	on_attach = on_attach,
		 	-- root_dir = lspconfig.util.root_pattern("package.json", "jsconfig.json", ".git"),
		 	root_dir = lspconfig.util.root_pattern("package.json", "jsconfig.json"),
		}

		-- biome
		lspconfig.pug.setup({})
		end
	},
}
