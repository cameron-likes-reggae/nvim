local builtin = require('telescope.builtin')

require('telescope').setup {
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      ".git"
    }
  },
}
-- require('telescope').load_extension('fzf')

vim.keymap.set('n', '<leader>/', function()
  require("telescope.builtin").current_buffer_fuzzy_find({
    previewer = false
  })
end)

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {})
vim.keymap.set('n', '<Space>fg', builtin.live_grep, {})
vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})
