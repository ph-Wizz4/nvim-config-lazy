-- const

local OBSIDIAN_VAULT = os.getenv("OBSIDIAN_VAULT")
local TICKET_DIR = "working/tickets/"
local TICKET_TEMPLATE_PATH = "templates/work_ticket.md"

local function get_ticket_path()
	-- new ticket
	local ticket_number = vim.fn.input("Ticket Number:")
	local new_file_path = OBSIDIAN_VAULT.."/"..TICKET_DIR..ticket_number..".md"
	return ticket_number, new_file_path
end


-- keymaps
vim.keymap.set('n', '<leader>o', function () vim.cmd [[Obsidian]] end)
vim.keymap.set('n', '<leader>os', function () vim.cmd [[ObsidianSearch]] end)
vim.keymap.set('n', '<leader>dl', function () vim.cmd [[ObsidianToday]] end)

vim.keymap.set('n', '<leader>ot', function ()
	local ticket_number, new_file_path = get_ticket_path()

	local function create_new_ticket_with_template ()
		-- print (ticket_number)
		print (new_file_path)
		-- create file
		local file, err = io.open(new_file_path, "w")
		if file == nil then
			error(err, 1)
			return
		end
		file.close(file)

		-- nav to new file
		vim.cmd("edit " .. new_file_path)
		vim.cmd("ObsidianTemplate " .. TICKET_TEMPLATE_PATH)

		print("New Ticket: " .. ticket_number .. ".md created.")
	end

	local f = io.open(new_file_path, "r")
	if f then
		f.close(f)
		vim.cmd("edit " .. new_file_path)
		print("file exist")
	else
		if ticket_number ~= "" then
			create_new_ticket_with_template()
		end
	end

end)

