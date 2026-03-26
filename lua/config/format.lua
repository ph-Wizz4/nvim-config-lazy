-- Unified CLI-based formatter configuration
local M = {}

local formatters = {
	python = { cmd = "black", check = "black", write_flag = false },
}

local prettier_ext = {
	javascript = ".js",
	typescript = ".ts",
	javascriptreact = ".jsx",
	typescriptreact = ".tsx",
	html = ".html",
	css = ".css",
	json = ".json",
	yaml = ".yaml",
	markdown = ".md",
}

local function build_cmd(formatter, filepath)
	local write_flag = formatter.write_flag ~= false and " --write" or ""
	return formatter.cmd .. write_flag .. ' "' .. filepath .. '" 2>&1'
end

local function get_formatter(filetype)
	return formatters[filetype]
end

local function is_executable(cmd)
	return vim.fn.executable(cmd) == 1
end

local function format_file(filetype)
	local formatter = get_formatter(filetype)

	if not formatter or not is_executable(formatter.check) then
		if is_executable("prettier") then
			formatter = { cmd = "prettier", check = "prettier" }
		else
			vim.cmd("normal! gggqG")
			print("Formatter not found, used default alignment")
			return
		end
	end

	local current_file = vim.fn.expand("%:p")
	local cmd = build_cmd(formatter, current_file) .. " && echo 'SUCCESS' || echo 'FAILED'"
	local handle = io.popen(cmd)
	local output = handle:read("*a")
	handle:close()
	local success = output:match("SUCCESS") ~= nil

	if success then
		print("Formatted with " .. formatter.cmd)
	else
		local err = output:gsub("SUCCESS", ""):gsub("FAILED", ""):match("^%s*(.-)%s*$")
		if err and err ~= "" then
			print("Error: " .. err)
		else
			print("Failed to format with " .. formatter.cmd)
		end
	end

	vim.cmd("edit")
end

local function format_range(start_line, end_line, filetype)
	local formatter = get_formatter(filetype)

	if not formatter or not is_executable(formatter.check) then
		if is_executable("prettier") then
			formatter = { cmd = "prettier", check = "prettier" }
		else
			vim.cmd(start_line .. "," .. end_line .. "=")
			print("Formatter not found, used default alignment")
			return
		end
	end

	local ext = {
		python = ".py",
	}
	for k, v in pairs(prettier_ext) do
		ext[k] = v
	end
	local temp_file_ext = "/tmp/format_temp" .. (ext[filetype] or ".txt")

	local lines = vim.fn.getline(start_line, end_line)
	vim.fn.writefile(lines, temp_file_ext)

	local cmd = build_cmd(formatter, temp_file_ext) .. " && echo 'SUCCESS' || echo 'FAILED'"
	local handle = io.popen(cmd)
	local output = handle:read("*a")
	handle:close()
	local success = output:match("SUCCESS") ~= nil

	if not success then
		local err = output:gsub("SUCCESS", ""):gsub("FAILED", ""):match("^%s*(.-)%s*$")
		print("Error: " .. (err or "format failed"))
		os.remove(temp_file_ext)
		return
	end

	local formatted_lines = vim.fn.readfile(temp_file_ext)
	vim.fn.setline(start_line, formatted_lines)
	os.remove(temp_file_ext)

	print("Formatted range with " .. formatter.cmd)
end

vim.api.nvim_create_user_command("FormatFile", function()
	local filetype = vim.bo.filetype
	format_file(filetype)
end, {})

vim.api.nvim_create_user_command("FormatRange", function()
	local start_line = vim.fn.line("'<")
	local end_line = vim.fn.line("'>")
	local filetype = vim.bo.filetype
	format_range(start_line, end_line, filetype)
end, { range = true })

vim.keymap.set("n", "<leader>F", "<cmd>FormatFile<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<leader>f", "<cmd>FormatRange<CR>", { noremap = true, silent = true })

return M
