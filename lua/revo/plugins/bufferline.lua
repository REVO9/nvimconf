return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup({
      options = {
        separator_style = "slope",
      },
    })

    local keymap = vim.keymap

    keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>")
    keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>")
    keymap.set("n", "<leader>x", "<cmd>BufferLinePickClose<CR>")
  end,

}
