return {
    "lervag/vimtex",

    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
        -- VimTeX configuration goes here, e.g.
        vim.g.vimtex_view_method = "zathura"

        vim.g.vimtex_compiler_method = 'tectonic'
        vim.g.vimtex_format_enabled = 1
        vim.opt.conceallevel = 1
        vim.g.tex_conceal = 'abdmg'

        local function get_paths(figure_name)
            local buf_path = vim.api.nvim_buf_get_name(0)
            local path = vim.fn.fnamemodify(buf_path, ":h")
            local figures_path = path .. "/figures/"
            vim.fn.mkdir(figures_path, "p")
            local rnote_template_path = vim.fn.stdpath('config') .. "/lua/revo/assets/template.rnote"
            return {
                figures_path = figures_path,
                rnote = figures_path .. figure_name .. ".rnote",
                svg = figures_path .. figure_name .. ".svg",
                png = figures_path .. figure_name .. ".png",
                template = rnote_template_path
            }
        end

        local function compile_figure(paths)
            vim.fn.jobstart({
                "rnote-cli",
                "export", "selection",
                "--on-conflict", "overwrite",
                "-o", paths.svg,
                "all",
                paths.rnote
            }, {
                stdout_buffered = true,
                stderr_buffered = true,
                on_exit = function(_, code)
                    if code ~= 0 then
                        print("rnote-cli export failed")
                        return
                    end
                    vim.fn.jobstart({
                        "magick", "convert",
                        paths.svg,
                        paths.png
                    }, { stdout_buffered = true, stderr_buffered = true })
                end
            })
        end

        function Figure(opts)
            local name = opts.fargs[1]
            local paths = get_paths(name)
            if vim.fn.filereadable(paths.rnote) == 0 then
                vim.fn.system({ "cp", paths.template, paths.rnote })
                compile_figure(paths)
            end
            vim.api.nvim_paste("\n\\includegraphics{figures/" .. name .. ".png}", false, -1)
        end

        function FigureEdit(opts)
            local name = opts.fargs[1]
            local paths = get_paths(name)
            if vim.fn.filereadable(paths.rnote) == 0 then
                error("Figure does not exist: " .. name)
            end
            vim.fn.jobstart({ "rnote", paths.rnote }, { detach = true })
        end

        function FigureUpdate(opts)
            local name = opts.fargs[1]
            local paths = get_paths(name)
            if vim.fn.filereadable(paths.rnote) == 0 then
                print("Figure does not exist: " .. name)
                return
            end
            compile_figure(paths)
        end

        local function list_figures()
            local buf_path = vim.api.nvim_buf_get_name(0)
            local path = vim.fn.fnamemodify(buf_path, ":h") .. "/figures/"
            local files = vim.fn.glob(path .. "*.rnote", false, true) -- list .rnote files
            local names = {}
            for _, f in ipairs(files) do
                table.insert(names, vim.fn.fnamemodify(f, ":t:r")) -- strip path and extension
            end
            return names
        end

        local function figure_complete(arg_lead, _, _)
            local names = list_figures()
            local matches = {}
            for _, n in ipairs(names) do
                if n:match("^" .. vim.pesc(arg_lead)) then
                    table.insert(matches, n)
                end
            end
            return matches
        end

        vim.api.nvim_create_user_command("Figure", Figure, { nargs = 1 })
        vim.api.nvim_create_user_command("FigureEdit", FigureEdit, { nargs = 1, complete = figure_complete })
        vim.api.nvim_create_user_command("FigureUpdate", FigureUpdate, { nargs = 1, complete = figure_complete })
    end
}
