return {
    "nvim-telescope/telescope.nvim",

    dependencies = {
        'nvim-lua/plenary.nvim',
        "debugloop/telescope-undo.nvim",
    },

    opts = {
        extensions = {
            undo = {
            },
        },
    },

    config = function()
        require("telescope").setup(opts)
        require("telescope").load_extension("undo")

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find Files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Find Grep' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find Buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find Help Tags' })
        vim.keymap.set('n', '<leader>fr', builtin.registers, { desc = 'Search Registers' })

        local undo = require("telescope-undo.actions")
        vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>", { desc = "undo history" })

        vim.keymap.set('i', '<cr>', undo.yank_additions, { desc = 'Yank Additions' })
        vim.keymap.set('i', '<S-cr>', undo.yank_deletions, { desc = 'Yank Deletions' })
        vim.keymap.set('i', '<C-cr>', undo.restore, { desc = 'Restore' })
    end,
}
