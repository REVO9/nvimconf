return {
    "xiyaowong/transparent.nvim",
    lazy = false,
    priority = 10,
    config = function()
        local opts = {
            groups = {
                'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
                'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
                'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
                'SignColumn', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
                'EndOfBuffer',
            },
            extra_groups = {
                -- "NormalFloat",  -- plugins which have float panel such as Lazy, Mason, LspInfo
                "NvimTreeNormal",   -- NvimTree
                "NvimTreeNormalNC", -- NvimTree
                "TroubleNormal",
                "TroubleNormalNc",
            },
            exclude_groups = {
                "CmpItemMenu"
            }
        }
        local transparent = require('transparent')
        transparent.setup(opts)
    end
}
