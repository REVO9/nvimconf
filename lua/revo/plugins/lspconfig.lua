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
          "rust_analyzer",
          "wgsl_analyzer",
          "cssls",
          "tsserver",
          "biome",
          "somesass_ls",
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup{}
      lspconfig.rust_analyzer.setup{}
      lspconfig.wgsl_analyzer.setup{}
      lspconfig.cssls.setup{}
      lspconfig.tsserver.setup{}
      lspconfig.biome.setup{
        single_file_support = true
      }
      lspconfig.somesass_ls.setup{}

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
          vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, { buffer = ev.buf, desc = 'Hover information' })
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = ev.buf, desc = 'Go to Implementation' })
          vim.keymap.set('n', '<leader>sh', vim.lsp.buf.signature_help, { buffer = ev.buf, desc = 'Signature Help' })
          vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder,
            { buffer = ev.buf, desc = 'Add Workspace Folder' })
          vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder,
            { buffer = ev.buf, desc = 'Remove Workspace Folder' })
          vim.keymap.set('n', '<leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, { buffer = ev.buf, desc = 'List Workspace Folders' })
          vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, { buffer = ev.buf, desc = 'Type Definition' })
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = ev.buf, desc = 'Rename' })
          -- keybind set in actions-preview.lua
          -- vim.keymap.set({ 'n', 'v' }, 'gf', vim.lsp.buf.code_action, { buffer = ev.buf, desc = 'Code Action' })
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = ev.buf, desc = 'References' })
          vim.keymap.set('n', '<leader>fm', function()
            vim.lsp.buf.format { async = true }
          end, { buffer = ev.buf, desc = 'Format Code' })
        end,
      })
    end
  },

}
