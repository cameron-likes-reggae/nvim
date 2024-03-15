require("themery").setup({
  themes = { "gruvbox", "catppuccin-mocha", "nightfly", "tokyonight-storm" }, -- Your list of installed colorschemes
  themeConfigFile = "~/.config/nvim/lua/settings/theme.lua",                  -- Described below
  livePreview = true,                                                         -- Apply theme while browsing. Default to true.
})

vim.keymap.set('n', '<F6>', '<cmd>Themery<CR>')
