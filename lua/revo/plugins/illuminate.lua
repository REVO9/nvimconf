return {
  "RRethy/vim-illuminate",
  event = { "BufReadPre", "BufNewFile" },
  opts = {},
  config = function ()
    require('illuminate').configure()
  end
}
