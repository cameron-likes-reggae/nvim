vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

require("nvim-tree").setup({
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  open_on_setup = true,
  git = {
    enable = true
  },
  renderer = {
    root_folder_modifier = ":t",
 -- These icons are visible when you install web-devicons
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  view = {
    width = 30,
    side = "left",
  },
})

vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')
