local neodev = require("neodev")
local lspconfig = require("lspconfig")

neodev.setup {}

lspconfig.lua_ls.setup {}

lspconfig.tsserver.setup {
  filetypes = { "typescript", "typescriptreact" },
  cmd = { "typescript-language-server", "--stdio" },
}
