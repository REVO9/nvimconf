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
      }
    })
  end
}
