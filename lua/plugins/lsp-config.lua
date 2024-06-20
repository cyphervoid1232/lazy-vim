return {
  {
   "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
   'williamboman/mason-lspconfig.nvim',
    config = function()
     require("mason-lspconfig").setup({
        ensure_installed = {"lua_ls", "angularls", "dockerls", "eslint", "groovyls", "tsserver", "yamlls"}
     }) 
    end
  },
  {
   "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.angularls.setup({})
      lspconfig.groovyls.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.eslint.setup({
        settings = {
          packageManager = 'yarn'
        },
        on_attach = function(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
      })
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})

    end
  }
}
