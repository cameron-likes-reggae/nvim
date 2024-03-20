require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = '┊',
    section_separators = { left = '', right = '' },
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
