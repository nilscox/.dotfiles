require("neodev").setup {}

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup {}

lspconfig.tsserver.setup {
  filetypes = { "typescript", "typescriptreact" },
  cmd = { "typescript-language-server", "--stdio" },
}
