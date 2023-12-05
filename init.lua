require('core.plugins')
require('core.keymaps')
require('core.plugin_config')
vim.wo.number = true
vim.opt.guicursor = ""
vim.opt.colorcolumn = "80"
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.relativenumber = true
vim.opt.listchars = 'tab:| ,lead:·,trail:·'
vim.diagnostic.config({ virtual_lines = { only_current_line = true } })
