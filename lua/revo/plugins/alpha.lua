return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'nvim-lua/plenary.nvim'
  },
  config = function()
    require 'alpha'.setup(require 'alpha.themes.theta'.config)

    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    dashboard.section.header.val = {
      "",
      "",
      " ███╗   ███╗███████╗ ██████╗ ██╗    ██╗ ██╗   ██╗██╗███╗   ███╗ ",
      " ████╗ ████║██╔════╝██╔═══██╗██║    ██║ ██║   ██║██║████╗ ████║ ",
      " ██╔████╔██║█████╗  ██║   ██║██║ █╗ ██║ ██║   ██║██║██╔████╔██║ ",
      " ██║╚██╔╝██║██╔══╝  ██║   ██║██║███╗██║ ╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      " ██║ ╚═╝ ██║███████╗╚██████╔╝╚███╔███╔╝  ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      " ╚═╝     ╚═╝╚══════╝ ╚═════╝  ╚══╝╚══╝    ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    }

    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[
      autocmd FileType alpha setlocal nofoldenable
    ]])
  end
};
