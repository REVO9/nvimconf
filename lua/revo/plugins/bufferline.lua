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
    keymap.set("n", "<leader>bx", "<cmd>BufferLinePickClose<CR>", {desc = "Close a buffer"})
    keymap.set("n", "<leader>bc", "<cmd>BufferLinePick<CR>", {desc = "Choose a buffer"})
    keymap.set("n", "<leader>bo", "<cmd>BufferLineCloseOthers<CR>", {desc = "Close all other buffers"})
    keymap.set("n", "<leader>bs", "<cmd>BufferLineSortByDirectory<CR>", {desc = "Sort buffers"})
    keymap.set("n", "<leader>bp", "<cmd>BufferLineTogglePin<CR>", {desc = "Pin buffer"})

    -- vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete", "BufEnter" }, {
    --   callback = function()
    --     vim.api.nvim_command_output("BufferLineSortByDirectory")
    --   end,
    -- })
  end,

}
