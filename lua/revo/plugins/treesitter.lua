return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "rust", "wgsl" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },
  {
    "norcalli/nvim-colorizer.lua", -- for color
    opts = {
      -- RGB      = true,
      -- RRGGBB   = true,
      -- names    = true,
      -- RRGGBBAA = true,
      -- rgb_fn   = true,
      -- hsl_fn   = true,
      -- css      = true,
      -- css_fn   = true,
    },
    config = true,
  },
}
