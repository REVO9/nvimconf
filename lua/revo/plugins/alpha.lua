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
    dashboard.section.buttons.val = {
        dashboard.button("e", "  New file", "<cmd>ene <CR>"),
        dashboard.button("SPC f f", "󰈞  Find file"),
        dashboard.button("SPC f g", "󰈬  Find word"),
        dashboard.button("SPC s s", "  Open last session"),
        dashboard.button("SPC s l", "  Open a session"),
    },

    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[
      autocmd FileType alpha setlocal nofoldenable
    ]])
  end
};
