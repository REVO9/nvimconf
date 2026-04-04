return {
    "allaman/emoji.nvim",
    ft = "markdown", -- adjust to your needs
    dependencies = {
        -- optional for telescope integration
        "nvim-telescope/telescope.nvim",
    },
    keys = {
        { "<leader>se", desc = '[S]earch [E]moji' },
    },
    config = function(_, opts)
        require("emoji").setup(opts)
        -- optional for telescope integration
        print("nya")
        local ts = require('telescope').load_extension('emoji')
        vim.keymap.set('n', '<leader>se', ts.emoji, { desc = '[S]earch [E]moji' })
    end,
}
