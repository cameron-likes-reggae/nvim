require("neo-tree").setup({
  filesystem = {
    follow_current_file = {
      enabled = true
    },
    filtered_items = {
      visible = true,
      show_hidden_count = true,
      hide_dotfiles = false,
      hide_gitignored = false
    }
  },
  source_selector = {
    winbar = false,
    statusline = true
  },
  git_status = {
    symbols = {
      -- Change type
      added     = "U", -- or "✚", but this is redundant info if you use git_status_colors on the name
      modified  = "M", -- or "", but this is redundant info if you use git_status_colors on the name
      deleted   = "D", -- this can only be used in the git_status source
      renamed   = "R", -- this can only be used in the git_status source
      -- Status type
      untracked = "u", --"",
      ignored   = "",
      unstaged  = "󰄱",
      staged    = "",
      conflict  = "",
    }
  },
  window = {
    position = "current"
  }
})

vim.keymap.set("n", "<leader>ef", "<cmd>Neotree<cr>")
vim.keymap.set("n", "<leader>eb", "<cmd>Neotree buffers<cr>")
vim.keymap.set("n", "<leader>eg", "<cmd>Neotree git_status<cr>")
