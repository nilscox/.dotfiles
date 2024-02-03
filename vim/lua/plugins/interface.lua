return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = 'night',
      light_style = 'day',
    },
  },

  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabaled = true,
        theme = 'tokyonight',
      }
    },
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    enabled = false,
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
    },
  },
}
