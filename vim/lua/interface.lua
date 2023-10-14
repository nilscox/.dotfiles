local lualine = require('lualine');
local ts = require("nvim-treesitter.configs")

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'onedark',
  }
}

ts.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "c",
    "lua",
    "vim",
    "vimdoc",
    "query",
    "tsx",
    "json",
    "yaml",
    "css",
    "html",
  },
  autotag = {
    enable = true,
  },
}
