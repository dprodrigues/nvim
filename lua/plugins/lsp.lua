return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim"
  },
  config = function()
    local languages = {
      "lua_ls",
      "ts_ls",
      "pyright",
      "vimls",
      "jsonls",
      "html",
      "cssls",
      "dockerls",
      "graphql",
      "rust_analyzer",
      "sqlls",
      "ast_grep"
    }

    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = languages,
    })

    local capabilities = require("blink.cmp").get_lsp_capabilities()

    for i = 1, #languages do
      vim.lsp.config(languages[i], { capabilities = capabilities })
    end

    -- Keymaps for LSP
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(event)
        local builtin = require "telescope.builtin"

        require "config.telescope"

        vim.keymap.set("n", "gd", builtin.lsp_definitions, { buffer = 0 })
        vim.keymap.set("n", "gr", builtin.lsp_references, { buffer = 0 })

        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })
        vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
        vim.keymap.set("n", "gh", vim.lsp.buf.hover, { buffer = 0 })

        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = 0 })
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = 0 })
      end,
    })

    -- Inline errors and warnings
    vim.diagnostic.config({
      virtual_text = {
        prefix = "*",
        format = function(diagnostic)
          return string.format(" %s: %s", diagnostic.source, diagnostic.message)
        end
      }
    })
  end,
}
