-- Unfocus terminal with <Esc>
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Center view after jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Yank to system clipboard with leader key
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p')

vim.keymap.set("n", "<leader><leader>", "<C-^>", { noremap = true })

-- Clears highlighting after search
vim.keymap.set("n", "<CR>", ":noh<CR>", { silent = true, noremap = true })

-- Center view after search
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
