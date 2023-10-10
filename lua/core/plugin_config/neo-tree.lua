require("neo-tree").setup({
  filesystem = {
    follow_current_file = true,
    filtered_items = {
      visible = true,
      show_hidden_count = true,
      hide_dotfiles = false,
      hide_gitignored = false
    }
  },
  source_selector = {
    winbar = true,
    statusline = false
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
})

vim.keymap.set("n", "<leader>nf", "<cmd>Neotree<cr>")
vim.keymap.set("n", "<leader>nb", "<cmd>Neotree buffers<cr>")
vim.keymap.set("n", "<leader>ng", "<cmd>Neotree git_status<cr>")
