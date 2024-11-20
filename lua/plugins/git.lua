return {
  -- Vim Git Wrapper
  { "tpope/vim-fugitive", },

  -- Git tree
  { "rbong/vim-flog", },

  -- Show hunks in files
  "lewis6991/gitsigns.nvim",

  {
    "NeogitOrg/neogit",
    dependiencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",

      "nvim-telecope/telescope.nvim",
    },
    opts = {
      kind = "floating"
    },
  },
}
