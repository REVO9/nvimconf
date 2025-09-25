return {
    "nvim-telescope/telescope.nvim",

    dependencies = {
        'nvim-lua/plenary.nvim',
        "debugloop/telescope-undo.nvim",
        "nvim-telescope/telescope-symbols.nvim"
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
        vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Find Buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find Help Tags' })
        vim.keymap.set('n', '<leader>fr', builtin.registers, { desc = 'Search Registers' })
        vim.keymap.set('n', '<leader>fc', builtin.symbols, { desc = 'Find Special Chars' })
        vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = 'Search Local Symbols' })
        vim.keymap.set('n', '<leader>fS', builtin.lsp_workspace_symbols, { desc = 'Search Global Symbols' })

        local undo = require("telescope-undo.actions")
        vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>", { desc = "undo history" })

        vim.keymap.set('i', '<cr>', undo.yank_additions, { desc = 'Yank Additions' })
        vim.keymap.set('i', '<S-cr>', undo.yank_deletions, { desc = 'Yank Deletions' })
        vim.keymap.set('i', '<C-cr>', undo.restore, { desc = 'Restore' })
    end,
}
