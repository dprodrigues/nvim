local exec = 'lua-language-server'

if vim.fn.executable(exec) == 0 then
  vim.api.nvim_err_writeln(string.format('lsp: %q is not installed', exec))
  return
end

local lua_rtp = vim.split(package.path, ';')
table.insert(lua_rtp, 'lua/?.lua')
table.insert(lua_rtp, 'lua/?/init.lua')

return {
  lua_ls = true,

  vimls = false,
  ts_ls = false,
  jsonls = false,
  html = false,
  cssls = false,
  dockerls = false,
  graphql = false,
  ast_grep = false,
  tailwindcss = false,
  emmet_ls = false,
  eslint = false,

  pyright = false,
  rust_analyzer = false,
  sqlls = false,
}
