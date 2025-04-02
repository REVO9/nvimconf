return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")

        harpoon:setup()

        vim.keymap.set("n", "<S-h>", function() harpoon:list():add() end, { desc = "Add current file to Harpoon list" })
        vim.keymap.set("n", "<A-h>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
            { desc = "Open Harpoon quick menu" })

        vim.keymap.set("n", "<leader>j", function() harpoon:list():select(1) end, { desc = "Jump to Harpoon slot 1" })
        vim.keymap.set("n", "<leader>k", function() harpoon:list():select(2) end, { desc = "Jump to Harpoon slot 2" })
        vim.keymap.set("n", "<leader>l", function() harpoon:list():select(3) end, { desc = "Jump to Harpoon slot 3" })
        vim.keymap.set("n", "<leader>;", function() harpoon:list():select(4) end, { desc = "Jump to Harpoon slot 4" })

        vim.keymap.set("n", "<tab>", function() harpoon:list():prev() end,
            { desc = "Jump to previous buffer in Harpoon list" })
        vim.keymap.set("n", "<S-Tab>", function() harpoon:list():next() end,
            { desc = "Jump to next buffer in Harpoon list" })

        -- basic telescope configuration
        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers").new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                    results = file_paths,
                }),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({}),
            }):find()
        end

        vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
            { desc = "Open harpoon window" })
    end
}
