return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "wgsl_analyzer",
                    "cssls",
                    "ts_ls",
                    "biome",
                    "somesass_ls",
                    "glsl_analyzer",
                    "lemminx",
                    "clangd",
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.config['rust-analyzer'] = {
                cmd = { 'rust-analyzer' },
                filetypes = { 'rust', 'rs' },
            }
            vim.lsp.enable('rust-analyzer')

            -- keymaps
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local opts = { buffer = ev.buf }
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = ev.buf, desc = 'Go to Declaration' })
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf, desc = 'Go to Definition' })
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation,
                        { buffer = ev.buf, desc = 'Go to Implementation' })
                    vim.keymap.set('n', '<leader>sh', vim.lsp.buf.signature_help,
                        { buffer = ev.buf, desc = 'Signature Help' })
                    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder,
                        { buffer = ev.buf, desc = 'Add Workspace Folder' })
                    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder,
                        { buffer = ev.buf, desc = 'Remove Workspace Folder' })
                    vim.keymap.set('n', '<leader>wl', function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, { buffer = ev.buf, desc = 'List Workspace Folders' })
                    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition,
                        { buffer = ev.buf, desc = 'Type Definition' })
                    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = ev.buf, desc = 'Rename' })
                    -- keybind set in actions-preview.lua
                    -- vim.keymap.set({ 'n', 'v' }, 'gf', vim.lsp.buf.code_action, { buffer = ev.buf, desc = 'Code Action' })
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = ev.buf, desc = 'References' })
                end,
            })

            vim.keymap.set('n', '<leader>fm', function()
                local documentFormattingProvider
                if vim.lsp.get_clients()[1] and
                    vim.lsp.get_clients()[1].server_capabilities and
                    vim.lsp.get_clients()[1].server_capabilities.documentFormattingProvider then
                    documentFormattingProvider = vim.lsp.get_clients()[1].server_capabilities.documentFormattingProvider
                else
                    documentFormattingProvider = nil
                end
                print(documentFormattingProvider)
                if documentFormattingProvider == true then
                    vim.lsp.buf.format { async = true }
                    return
                end
                require("conform").format()
            end, { desc = 'Format Code' })
        end
    },
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                typst = { "typstyle" },
                nix = { "alejandra" }
            },

            formatters = {
                typstyle = {
                    append_args = { "--wrap-text" }
                }
            }
        },
    },
    {
        "scalameta/nvim-metals",
        ft = { "scala", "sbt", "java" },
        opts = function()
            local metals_config = require("metals").bare_config()
            metals_config.on_attach = function(client, bufnr)
                -- your on_attach function
            end

            return metals_config
        end,
        config = function(self, metals_config)
            local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
            vim.api.nvim_create_autocmd("FileType", {
                pattern = self.ft,
                callback = function()
                    require("metals").initialize_or_attach(metals_config)
                end,
                group = nvim_metals_group,
            })
        end
    }
}
