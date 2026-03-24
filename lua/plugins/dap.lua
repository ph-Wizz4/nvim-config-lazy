-- nvim-dap: Debug Adapter Protocol
-- Related: config/dap.lua (signs configuration)
return  {
	{ "rcarriga/nvim-dap-ui",
	dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
	config = function ()

		local dap, dapui = require("dap"), require("dapui")

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		local port = 9030
		local JS_DEBUG_HOME = os.getenv("JS_DEBUG_HOME")
		dap.adapters["pwa-node"] = {
			port = 9030,
			type = "server",
			host = "localhost",
			executable = {
				command = "node",
				-- 💀 Make sure to update this path to point to your installation
				args = {JS_DEBUG_HOME .. "/dapDebugServer.js", "9030"},
			}
		}
		dap.adapters["pwa-chrome"] = {
			port = 9222,
			type = "server",
			host = "localhost",
			executable = {
				command = "node",
				-- 💀 Make sure to update this path to point to your installation
				args = {JS_DEBUG_HOME .. "/dapDebugServer.js", "9222"},
			}
		}
		dap.configurations.javascript = {
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch file",
				program = "${file}",
				cwd = "${workspaceFolder}",
			},
			{
				type = "pwa-node",
				request = "attach",
				name = "Attach to Node Process",
				port = 9229, -- Default Node.js inspect port
				address = "localhost",
				cwd = "${workspaceFolder}",
				restart = true, -- Auto-reconnect if the process restarts
				sourceMaps = true, -- Enable source maps for compiled code
				skipFiles = { "<node_internals>/**" }, -- Skip Node.js internal files
			},
			{
				type = "pwa-chrome",
				request = "launch",
				name = "launch Chrome",
				port = 9222, -- Matches Chrome's remote debugging port
				url = "http://localhost:3131", -- Your dev server's URL
				webRoot = "${workspaceFolder}", -- Path to your source files
				sourceMaps = true,
				skipFiles = { "<node_internals>/**", "**/node_modules/**" },
			},
			{
				type = "pwa-chrome",
				request = "attach",
				name = "Attach to Chrome",
				port = 9222, -- Matches Chrome's remote debugging port
				url = "http://localhost:3131", -- Your dev server's URL
				webRoot = "${workspaceFolder}", -- Path to your source files
				sourceMaps = true,
				skipFiles = { "<node_internals>/**", "**/node_modules/**" },
			},
		}

		-- Configure DAP UI with custom icons
		dapui.setup({
			icons = {
				expanded = "▾",  -- Icon for expanded nodes
				collapsed = "▸", -- Icon for collapsed nodes
				current_frame = "→", -- Icon for current stack frame
			},
			controls = {
				enabled = true,
				element = "repl", -- Show controls in the REPL
				icons = {
					pause = "⏸️",
					play = "▶",
					step_into = "Step Into",
					step_over = "Step Over",
					step_out = "Step Out",
					step_back = "◄",
					run_last = "↻",
					terminate = "⏹",
					disconnect = "⏏",
				},
			},
			layouts = {
				{
					elements = {
						{ id = "scopes", name = "Scopes", size = 0.25 },
						{ id = "breakpoints", name = "Breakpoints", size = 0.25 },
						{ id = "stacks", name = "Stacks", size = 0.25 },
						{ id = "watches", name = "Watches", size = 0.25 },
					},
					size = 40, -- Width of the sidebar
					position = "left", -- Sidebar on the left
				},
				{
					elements = {
						{ id = "repl", name = "REPL", size = 0.5 },
						{ id = "console", name = "Console", size = 0.5 },
					},
					size = 10, -- Height of the bottom panel
					position = "bottom", -- Panel at the bottom
				},
			},
			floating = {
				max_height = nil, -- Optional: Limit floating window size
				max_width = nil, -- Optional: Limit floating window size
				border = "rounded", -- Border style for floating windows
				mappings = {
					close = { "q", "<Esc>" }, -- Key to close floating window
				},
			},
		})

	end
}
}
