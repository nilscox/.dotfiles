local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "junegunn/fzf",
  "junegunn/fzf.vim",
  "nvim-lualine/lualine.nvim",
  "neovim/nvim-lspconfig",
  "folke/neodev.nvim",
  "onsails/lspkind-nvim",
  "L3MON4D3/LuaSnip",
  "hrsh7th/cmp-nvim-lsp",
  -- "hrsh7th/cmp-buffer",
  "hrsh7th/nvim-cmp",
  "nvim-treesitter/nvim-treesitter",
  "sainnhe/edge",
  { 'nvim-telescope/telescope.nvim', tag = '0.1.4', dependencies = { 'nvim-lua/plenary.nvim' } },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
})

