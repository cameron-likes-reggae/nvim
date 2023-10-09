vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true

-- use spaces for tabs --
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Ctrl + h and Ctrl + l to switch windows --
vim.keymap.set('n', '<C-h>', '<C-w><Left>')
vim.keymap.set('n', '<C-l>', '<C-w><Right>')

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.keymap.set('n', '<leader>t', ':terminal<CR>i')
