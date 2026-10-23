return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        vim.cmd('set laststatus=3')
        require('lualine').setup({
            options = {
                section_separators = { left = '', right = '' },
                component_separators = { left = '/', right = '/' },
                options = { theme = 'nightfly' }
            },
            sections = {
                lualine_a = { 'mode', require("recorder").recordingStatus },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = {
                    {
                        'filename',
                        path = 1,
                    },
                },
                lualine_x = { 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
        })
    end
}
