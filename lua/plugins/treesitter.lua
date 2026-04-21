return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  lazy = false,
  init = function()
    local ensureInstalled = {
      "c",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "markdown",
      "markdown_inline",
      "typescript",
      "python",
      "rust",
      "go",
      "html",
      "javascript",
      "typescript",
      "json",
    }

    local alreadyInstalled = require("nvim-treesitter.config").get_installed()
    local parsersToInstall = vim.iter(ensureInstalled)
      :filter(function(parser)
        return not vim.tbl_contains(alreadyInstalled, parser)
      end)
      :totable()
    require("nvim-treesitter").install(parsersToInstall)

    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
        vim.bo.indentexpr = 'v:lua.require"nvim-treesitter".indentexpr()'
      end
    })
  end,
}
