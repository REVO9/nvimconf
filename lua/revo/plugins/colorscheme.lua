return {
    {
        "catppuccin/nvim",
        priority = 900,
        lazy = false,
        config = function()
            require('catppuccin').setup({
                transparent_background = true,
            })
        end
    },
    {
        "scottmckendry/cyberdream.nvim",
        priority = 900,
        lazy = false,
        config = function()
            require('cyberdream').setup({
                transparent = true,
            })
        end
    },
    {
        "AlexvZyl/nordic.nvim",
        priority = 900,
        lazy = false,
        config = function()
            require('nordic').setup({
                transparent = {
                    bg = true,
                    float = true,
                },

            })

            vim.cmd.colorscheme('nordic')
        end
    },
    {
        "folke/tokyonight.nvim",
        priority = 900,
        lazy = false,
        config = function()
            require('tokyonight').setup({
                transparent = true,
            })
        end
    },
}
