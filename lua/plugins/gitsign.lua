return {
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            local function is_git_repository(path)
                -- Check if .git directory exists in the given path
                local git_dir_path = path .. "/.git"
                local f = io.open(git_dir_path, "r")
                if f then
                    f:close()
                    return true
                else
                    return false
                end
            end

            local current_dir = vim.fn.getcwd() -- Use Neovim's API to get current working directory
            if is_git_repository(current_dir) then
                require('gitsigns').setup()
            end
        end,
    },
}
