return {
    "lervag/vimtex",

    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    dependencies = {
        "rktjmp/fwatch.nvim"
    },
    init = function()
        -- VimTeX configuration goes here, e.g.
        vim.g.vimtex_view_method = "zathura"

        vim.g.vimtex_compiler_method = 'tectonic'
        vim.g.vimtex_format_enabled = 1
        vim.opt.conceallevel = 1
        vim.g.tex_conceal = 'abdmg'

        vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
            pattern = { '*.tex' },
            callback = function(ev)
                vim.api.nvim_cmd({ cmd = "VimtexCompile" }, { output = false });
            end
        })
        vim.api.nvim_create_autocmd({ 'CursorMoved' }, {
            pattern = { '*.tex' },
            callback = function(ev)
                vim.api.nvim_cmd({ cmd = "VimtexView" }, { output = false });
            end
        })
    end
}
