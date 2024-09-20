local builtin = require("telescope.builtin")

require("telescope").setup({
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      ".git",
    },
    file_includes = {
      ".env"
    },
  },
})

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
-- vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, {})
vim.keymap.set("n", "<leader>.", builtin.oldfiles, {})
vim.keymap.set("n", "<Space>fg", builtin.live_grep, {})
vim.keymap.set("n", "<Space>fh", builtin.help_tags, {})
