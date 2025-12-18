return {
    'chomosuke/typst-preview.nvim',
    lazy = false, -- or ft = 'typst'
    version = '1.*',
    config = function()
        local keymap = vim.keymap
        keymap.set("n", "<leader>lpp", "TypstPreview", { desc = "open typst documenet preview" })
        keymap.set("n", "<leader>tps", "TypstPreviewSyncCursor", { desc = "typst sync cursor" })
        require("typst-preview").setup {
            open_cmd = 'qutebrowser %s'
        }
    end
}
