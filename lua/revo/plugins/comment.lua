return {
  "numToStr/Comment.nvim",
  opts = {

  },
  event = { "BufReadPre", "BufNewFile" },

  config = function()
    require('Comment').setup({
      toggler = {
        ---Line-comment toggle keymap
        line = '<leader>/',
        ---Block-comment toggle keymap
        block = '<leader>?',
      },
      ---LHS of operator-pending mappings in NORMAL and VISUAL mode
      opleader = {
        ---Line-comment keymap
        line = '<leader>/',
        ---Block-comment keymap
        block = '<leader>?',
      },
      ---LHS of extra mappings
      extra = {
        ---Add comment on the line above
        above = '<leader>cO?',
        ---Add comment on the line below
        below = '<leader>co',
        ---Add comment at the end of line
        eol = '<leader>ce',
      },
    })

    require('Comment.ft').set("wgsl", { "//%s", "/*%s*/" })
  end
}
