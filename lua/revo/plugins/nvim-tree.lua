return {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        require("nvim-tree").setup({
            git = {
                enable = true,
            },

            renderer = {
                highlight_git = true,
                icons = {
                    show = {
                        git = true,
                    },
                },
            },

            view = {
                side = "right",
            },
        });

        vim.api.nvim_create_autocmd("TermEnter", {
            pattern = "*",
            callback = function()
                vim.api.nvim_command('NvimTreeRefresh')
            end,
        })

        vim.api.nvim_create_autocmd("TermLeave", {
            pattern = "*",
            callback = function()
                vim.api.nvim_command('NvimTreeRefresh')
            end,
        })
    end
}
