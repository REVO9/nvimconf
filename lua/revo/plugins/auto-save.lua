return {
    "okuuva/auto-save.nvim",
    version = '^1.0.0',                       -- see https://devhints.io/semver, alternatively use '*' to use the latest tagged release
    cmd = "ASToggle",                         -- optional for lazy loading on command
    event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
    opts = {
        condition = function(buf)
            local filetype = vim.fn.getbufvar(buf, "&filetype")

            -- don't save for `sql` file types
            if vim.list_contains({ "harpoon" }, filetype) then
                return false
            end
            return true
        end
    },
}
