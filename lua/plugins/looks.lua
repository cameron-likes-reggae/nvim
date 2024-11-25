return {
  -- Colorschemes
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        transparent = true })
      vim.cmd("colorscheme kanagawa")
    end,
  },

  -- Beautiful status bar
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = '¦',
        section_separators = {
          right = '',
          left = '',
        },
      },
      sections = {
        lualine_a = {
          { 'filename', path = 1 },
        },
      },
    },
  },

  -- File icons for file explorer
  "nvim-tree/nvim-web-devicons",
  {
    "rachartier/tiny-devicons-auto-colors.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "rebelot/kanagawa.nvim"
    },
    event = "VeryLazy",
    -- config = function()
    --   require("tiny-devicons-auto-colors").setup({
    --     colors = require("kanagawa.colors").setup().palette,
    --   })
    -- end,
  },

  -- Indentation guides
  "echasnovski/mini.indentscope",
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

  -- LSP status
  {
    "j-hui/fidget.nvim",
    opts = {
      -- options
    },
  },
}
