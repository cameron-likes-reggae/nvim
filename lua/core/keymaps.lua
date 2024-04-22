vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.backspace = "2"
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true

-- use spaces for tabs --
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

-- Unfocus terminal with <Esc>
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Center view after jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Yank to system clipboard with leader key
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>p", '"+P')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>p", '"+P')

vim.keymap.set("n", "<leader><leader>", "<C-^>", { noremap = true })

-- Clears highlighting after search
vim.keymap.set("n", "<CR>", ":noh<CR>", { silent = true, noremap = true })

-- Center view after search
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
