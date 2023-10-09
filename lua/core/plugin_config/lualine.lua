require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'dracula-nvim',
  },
  sections = {
    lualine_a = {
      {
        'filename',
        path = 1,
      }
    }
  }
}
