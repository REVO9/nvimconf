return {
    'akinsho/toggleterm.nvim',
    version = "*",
    keys = [[<C-\>]],
    opts = {
    },

    config = function()
        require("toggleterm").setup({
            open_mapping = [[<c-\>]],
            direction = 'float',
        })
    end
}
