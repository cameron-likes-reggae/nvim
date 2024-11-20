return {
  -- Colorschemes
  {
    "rebelot/kanagawa.nvim",
    opts = { transparent = true }
  },

  -- Beautiful status bar
  "nvim-lualine/lualine.nvim",

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
