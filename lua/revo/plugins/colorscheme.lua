return {
  { "catppuccin/nvim" },
  { "shaunsingh/nord.nvim" },
  {
    "folke/tokyonight.nvim",
    priotiy = 900,
    config = function()
      vim.cmd([[colorscheme tokyonight-moon]])
    end
  },
}
