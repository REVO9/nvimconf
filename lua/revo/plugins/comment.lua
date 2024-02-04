return {
  "numToStr/Comment.nvim",
  opts = {

  },
  event = { "BufReadPre", "BufNewFile" },

  config = function()
    require('Comment').setup()
    local api = require('Comment.api')

    vim.keymap.set({ "n", "v" }, "<leader>/", api.toggle.linewise.current, { desc = "comment line" })
  end
}
